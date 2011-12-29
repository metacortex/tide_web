# == Schema Information
#
# Table name: users
#
#  id                              :integer(4)      not null, primary key
#  email                           :string(255)
#  crypted_password                :string(255)
#  salt                            :string(255)
#  remember_me_token               :string(255)
#  remember_me_token_expires_at    :datetime
#  reset_password_token            :string(255)
#  reset_password_token_expires_at :datetime
#  reset_password_email_sent_at    :datetime
#  name                            :string(255)
#  name_e                          :string(255)
#  work                            :text
#  vision                          :text
#  skills                          :text
#  desc                            :text
#  profile_image                   :string(255)
#  website                         :string(255)
#  facebook                        :string(255)
#  twitter                         :string(255)
#  googleplus                      :string(255)
#  linkedin                        :string(255)
#  role                            :string(255)
#  created_at                      :datetime
#  updated_at                      :datetime
#  connections_count               :integer(4)      default(0)
#  posts_count                     :integer(4)      default(0)
#  comments_count                  :integer(4)      default(0)
#  agreements_count                :integer(4)      default(0)
#  votes_count                     :integer(4)      default(0)
#  rank                            :integer(4)      default(0)
#  ranking                         :integer(4)      default(0)
#  score                           :integer(4)      default(0)
#  score_week                      :integer(4)      default(0)
#  score_month                     :integer(4)      default(0)
#  score_year                      :integer(4)      default(0)
#

class User < ActiveRecord::Base
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end
  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :name, :name_e

  def admin?
    role == "admin"
  end

  def editor?
    role == "editor"
  end
  
  def staff?
    (role == "editor") || (role == "staff")
  end
  
  include ScopeSearchable
  scope :as_admin,  where(:role => "admin")
  scope :as_editor, where(:role => "editor")
  scope :as_staff,  where(:role => "staff")


  mount_uploader :profile_image, ProfileUploader
  
  def profile_image_url
    if auth = authentications.first
      "http://graph.facebook.com/#{auth.uid}/picture"
    else
      "/assets/placeholder.png"
    end
  end
  

  has_many :taggings, :dependent => :destroy, :as => :content
  has_many :tags, :through => :taggings, :uniq => true, :foreign_key => :tag_id

  accepts_nested_attributes_for :taggings, :allow_destroy => true, :reject_if => lambda {|a| a[:name].blank? }

  has_many :posts
  has_many :comments
  has_many :agreements, :dependent => :destroy

  has_many :connections, :dependent => :destroy, :conditions => '!isNull(connections.accepted_at)'
  has_many :connection_requests, :dependent => :destroy, :class_name => "Connection", :foreign_key => :user_id, :conditions => "isNull(connections.accepted_at)"
  has_many :connection_requested, :dependent => :destroy, :class_name => "Connection", :foreign_key => :target_id, :conditions => "isNull(connections.accepted_at)"
  
  has_many :recommendations, :conditions => '!isNull(connections.accepted_at)', :class_name => "Connection", :foreign_key => :target_id



  def self.categories
    ["technology","design","entrepreneur"]
  end
  
  def self.recently_joined(num = 10)
    User.order("id DESC").limit(num)
  end

  def self.weekly_active(num = 10)
    User.order("score_week DESC").limit(num)
  end
  
  
  def connected_to?(u)
    connections.detect {|c| c.target_id == u.id }
  end
  
  def connection_requested_to?(u)
    connection_requests.detect {|c| c.target_id == u.id }
  end

  def connection_request_received_from?(u)
    connection_requested.detect {|c| c.user_id == u.id }
  end




  private
  
    after_create :connect_invited_users
    
    def connect_invited_users
      Invitation.where(:email => self.email).each do |iv|
        iv.accept!
        Connection.make_pair(self, iv.user, iv.kind) if iv.user
      end
    end



end
