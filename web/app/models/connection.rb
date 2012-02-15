# == Schema Information
#
# Table name: connections
#
#  id              :integer(4)      not null, primary key
#  user_id         :integer(4)
#  target_id       :integer(4)
#  connection_type :string(255)
#  remark          :string(255)
#  accepted_at     :datetime
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

class Connection < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :target, :class_name => "User"
  
  
  validates_uniqueness_of :target_id, :scope => :user_id


  def self.connection_types
    ["co-worker","classmate","friend","etc"]
  end
  
  scope :has_remark, where("Length(connections.remark) > 0")
  scope :as_co_worker, where(:connection_type => "co-worker")
  scope :as_classmate, where(:connection_type => "classmate")
  scope :as_friend, where(:connection_type => "friend")
  scope :as_etc, where(:connection_type => "etc")



  def self.make_pair(u1, u2, kind)
    a = Time.now

    Connection.create(user_id:u1.id, target_id:u2.id, connection_type:kind, accepted_at:a)
    Connection.create(user_id:u2.id, target_id:u1.id, connection_type:kind, accepted_at:a)
    
    User.increment_counter(:connections_count, u1.id)
    User.increment_counter(:connections_count, u2.id)
  end


  def accept!
    a = Time.now
    self.accepted_at = a
    self.save
    
    Connection.create(user_id:target_id, target_id:user_id, connection_type:connection_type, accepted_at:a)
    
    User.increment_counter(:connections_count, user_id)
    User.increment_counter(:connections_count, target_id)
  end
  
  def deny!
    self.destroy
  end
  
  def clear!
    self.destroy

    Connection.where(user_id:target_id, target_id:user_id).each(&:destroy)

    User.decrement_counter(:connections_count, user_id)
    User.decrement_counter(:connections_count, target_id)
  end
  

end
