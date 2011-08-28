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
#  created_at      :datetime
#  updated_at      :datetime
#

class Connection < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :target, :class_name => "User"
  
  
  validates_uniqueness_of :target_id, :scope => :user_id


  def self.connection_types
    ["co-worker","classmate","friend","etc"]
  end


  def accept!
    a = Time.now
    self.accepted_at = a
    self.save
    
    User.increment_counter(:connections_count, user_id)
    User.increment_counter(:connections_count, taget_id)
  end
  
  def deny!
    self.destroy
  end
  
  def clear!
    self.destroy

    User.decrement_counter(:connections_count, user_id)
    User.decrement_counter(:connections_count, taget_id)
  end

end
