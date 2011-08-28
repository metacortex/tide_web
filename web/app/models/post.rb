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
#  assets_count   :integer(4)      default(0)
#  taggings_count :integer(4)      default(0)
#  comments_count :integer(4)      default(0)
#  votes_count    :integer(4)      default(0)
#  t_votes_count  :integer(4)      default(0)
#  d_votes_count  :integer(4)      default(0)
#  e_votes_count  :integer(4)      default(0)
#  visits_count   :integer(4)      default(0)
#  score          :integer(4)      default(0)
#  published_at   :datetime
#  created_at     :datetime
#  updated_at     :datetime
#

require 'author_editable'
class Post < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :category, :counter_cache => true
  
  has_many :comments, :dependent => :destroy

  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings, :uniq => true, :foreign_key => :tag_id

  accepts_nested_attributes_for :taggings, :allow_destroy => true, :reject_if => lambda {|a| a[:name].blank? }

  include AuthorEditable
  
  validates_presence_of :title
  validates_length_of :body, :minimum => 4






end
