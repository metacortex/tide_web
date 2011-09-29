# == Schema Information
#
# Table name: events
#
#  id             :integer(4)      not null, primary key
#  name           :string(255)
#  body           :text
#  category       :string(255)
#  status         :string(255)
#  comments_count :integer(4)      default(0)
#  opened_at      :datetime
#  closed_at      :datetime
#  created_at     :datetime
#  updated_at     :datetime
#  poster_image   :string(255)
#  thumb_image    :string(255)
#  picture_image  :string(255)
#  abbr           :text
#

class Event < ActiveRecord::Base
  
  has_many :comments, :dependent => :destroy
  has_many :registrations, :dependent => :destroy
  
  validates_presence_of :name, :body

  mount_uploader :picture_image, PictureUploader
  mount_uploader :poster_image, PictureUploader
  mount_uploader :thumb_image, PictureUploader


  def accept_registration?
    status != "closed"
  end
  
  def upcoming?
    status != "ended"
  end
  
  

end
