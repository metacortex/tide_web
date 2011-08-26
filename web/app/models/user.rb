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
#  connected_count        :integer(4)      default(0)
#

class User < ActiveRecord::Base
  
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings, :uniq => true, :foreign_key => :tag_id

  accepts_nested_attributes_for :taggings, :allow_destroy => true, :reject_if => lambda {|a| a[:name].blank? }

  has_many :agreements, :dependent => :destroy

  has_many :connections, :dependent => :destroy, :conditions => "connections.accepted_at != null"
  has_many :connection_requests, :dependent => :destroy, :class_name => "Connection", :foreign_key => :user_id, :conditions => "isNull(connections.accepted_at)"
  has_many :connection_requested, :dependent => :destroy, :class_name => "Connection", :foreign_key => :target_id, :conditions => "isNull(connections.accepted_at)"

  mount_uploader :profile_image, ProfileUploader



  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me
  

  validates_presence_of :name


  def self.categories
    ["technology","design","entrepreneur"]
  end
  
  
  def connected_to?(u)
    connections.detect {|c| c.user_id == u.id }
  end
  
  def connection_requested_to?(u)
    connection_requests.detect {|c| c.user_id == u.id }
  end





end
