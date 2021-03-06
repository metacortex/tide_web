# == Schema Information
#
# Table name: posts
#
#  id             :integer(4)      not null, primary key
#  user_id        :integer(4)
#  category_id    :integer(4)
#  title          :string(255)
#  title_en       :string(255)
#  body           :text
#  body_en        :text
#  source_url     :string(255)
#  kind           :string(255)
#  picture_image  :string(255)
#  assets_count   :integer(4)      default(0)
#  comments_count :integer(4)      default(0)
#  votes_count    :integer(4)      default(0)
#  pv_count       :integer(4)      default(0)
#  score          :integer(4)      default(0)
#  published_at   :datetime
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#  edit_status    :string(255)
#  edit_note      :text
#

require 'author_editable'
class Post < ActiveRecord::Base
  
  belongs_to :user, :counter_cache => true
  belongs_to :category, :counter_cache => true
  
  has_many :comments, :dependent => :destroy, :as => :content

  has_many :taggings, :dependent => :destroy, :as => :content
  has_many :tags, :through => :taggings, :uniq => true, :foreign_key => :tag_id

  accepts_nested_attributes_for :taggings, :allow_destroy => true, :reject_if => lambda {|a| a[:name].blank? }

  include AuthorEditable
  
  validates_presence_of :title
  validates_length_of :body, :minimum => 4

  mount_uploader :picture_image, PictureUploader

  scope :published, where("isNull(edit_status) OR edit_status = 'published'")
  scope :not_published, where(:edit_status => ["rejected","waiting","draft"])
  include ScopeSearchable
  scope :rejected,  where(:edit_status => "rejected")
  scope :waiting,   where(:edit_status => "waiting")
  scope :draft,     where(:edit_status => "draft")


  def published?
    edit_status == "published"
  end

  def rejected?
    edit_status == "rejected"
  end



end
