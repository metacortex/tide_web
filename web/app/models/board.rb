# == Schema Information
#
# Table name: boards
#
#  id             :integer(4)      not null, primary key
#  user_id        :integer(4)
#  user_username  :string(255)
#  title          :string(255)
#  body           :text
#  body_format    :string(255)
#  image_1        :string(255)
#  image_2        :string(255)
#  image_3        :string(255)
#  mode           :string(255)
#  category       :string(255)
#  device         :string(255)
#  pv_count       :integer(4)      default(0)
#  comments_count :integer(4)      default(0)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#

class Board < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :title, :body
  
  mount_uploader :image_1, PictureUploader
  mount_uploader :image_2, PictureUploader
  mount_uploader :image_3, PictureUploader

  has_many :comments, :as => :content, :dependent => :destroy


  scope :as_notice,  where("mode = 'notice'")
  scope :not_notice, where("isNull(mode) OR mode != 'notice'")


  def has_image?
    [image_1, image_2, image_3].any? {|t| t.present?}
  end
  
  def image_count
    [:image_1?, :image_2?, :image_3?].select {|t| send(t)}.size
  end
  
  def mode_notice?
    mode == "notice"
  end
  
  def removable?
    true
  end

  def prev_post(num = 1)
    c = Board.where("id < ?", id)
    c = c.order("id DESC").limit(num)
  end
  
  def next_post(num = 1)
    c = Board.where("id > ?", id)
    c = c.order("id DESC").limit(num)
  end
  
end
