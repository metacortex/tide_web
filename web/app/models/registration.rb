# == Schema Information
#
# Table name: registrations
#
#  id         :integer(4)      not null, primary key
#  event_id   :integer(4)
#  name       :string(255)
#  email      :string(255)
#  phone      :string(255)
#  address    :string(255)
#  desc       :text
#  status     :string(255)
#  reg_type   :string(255)
#  attachment :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Registration < ActiveRecord::Base
  
  belongs_to :event_id
  
  validates_presence_of :name, :email, :phone, :address, :desc
  

end
