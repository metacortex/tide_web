# == Schema Information
#
# Table name: events
#
#  id             :integer(4)      not null, primary key
#  name           :string(255)
#  body           :text
#  event_type     :string(255)
#  comments_count :integer(4)      default(0)
#  opened_at      :datetime
#  closed_at      :datetime
#  created_at     :datetime
#  updated_at     :datetime
#  picture_image  :string(255)
#  abbr           :text
#

class Event < ActiveRecord::Base
  
  has_many :comments, :dependent => :destroy
  has_many :registrations, :dependent => :destroy
  
  validates_presence_of :name, :body

  mount_uploader :picture_image, PictureUploader


end
