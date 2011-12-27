# == Schema Information
#
# Table name: users
#
#  id                     :integer(4)      not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer(4)      default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  name                   :string(255)
#  role                   :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  name_e                 :string(255)
#  location               :string(255)
#  category               :string(255)
#  website                :text
#  work                   :string(255)
#  interest               :string(255)
#  profile_image          :string(255)
#  connections_count      :integer(4)      default(0)
#  posts_count            :integer(4)      default(0)
#  comments_count         :integer(4)      default(0)
#  agreements_count       :integer(4)      default(0)
#  votes_count            :integer(4)      default(0)
#  score_all              :integer(4)      default(0)
#  score_total            :integer(4)      default(0)
#  score_week             :integer(4)      default(0)
#  score                  :text
#  ranking_all            :integer(4)      default(0)
#  ranking_total          :integer(4)      default(0)
#  ranking_week           :integer(4)      default(0)
#

class User < ActiveRecord::Base
  
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings, :uniq => true, :foreign_key => :tag_id

  accepts_nested_attributes_for :taggings, :allow_destroy => true, :reject_if => lambda {|a| a[:name].blank? }

  has_many :posts
  has_many :comments
  has_many :agreements, :dependent => :destroy

  has_many :connections, :dependent => :destroy, :conditions => '!isNull(connections.accepted_at)'
  has_many :connection_requests, :dependent => :destroy, :class_name => "Connection", :foreign_key => :user_id, :conditions => "isNull(connections.accepted_at)"
  has_many :connection_requested, :dependent => :destroy, :class_name => "Connection", :foreign_key => :target_id, :conditions => "isNull(connections.accepted_at)"
  
  has_many :recommendations, :conditions => '!isNull(connections.accepted_at)', :class_name => "Connection", :foreign_key => :target_id
  

  # def connections
  #   Connection.where("connections.target_id = ? OR connections.user_id = ?", id, id).where("!isNull(connections.accepted_at)")
  # end
  
  mount_uploader :profile_image, ProfileUploader



  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications


  validates_presence_of :name, :name_e


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

  def writer?
    role != nil
  end
  
  def editor?
    role == "editor"
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
