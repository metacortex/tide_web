# == Schema Information
#
# Table name: events
#
#  id             :integer(4)      not null, primary key
#  name           :string(255)
#  name_en        :string(255)
#  body           :text
#  abbr           :text
#  poster_image   :string(255)
#  thumb_image    :string(255)
#  picture_image  :string(255)
#  category       :string(255)
#  status         :string(255)
#  comments_count :integer(4)      default(0)
#  opened_at      :datetime
#  closed_at      :datetime
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#

class Event < ActiveRecord::Base
  
  has_many :comments, :dependent => :destroy, :as => :content
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
