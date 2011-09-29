# == Schema Information
#
# Table name: banners
#
#  id         :integer(4)      not null, primary key
#  category   :string(255)
#  event_id   :integer(4)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class Banner < ActiveRecord::Base
  
  belongs_to :event
  
end
