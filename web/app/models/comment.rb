# == Schema Information
#
# Table name: comments
#
#  id                        :integer(4)      not null, primary key
#  user_id                   :integer(4)
#  content_type              :string(255)
#  content_id                :integer(4)
#  body                      :text
#  agreements_count          :integer(4)      default(0)
#  positive_agreements_count :integer(4)      default(0)
#  negative_agreements_count :integer(4)      default(0)
#  created_at                :datetime
#  updated_at                :datetime
#

require 'author_editable'
class Comment < ActiveRecord::Base
  
  belongs_to :user, :counter_cache => true
  belongs_to :content, :polymorphic => true, :counter_cache => :comments_count
  
  has_many :agreements, :dependent => :destroy
  
  include AuthorEditable

  
  validates_presence_of :body
  
  
  def user_profile_image
    user.profile_image.url(:thumb)
  end
  

  scope :as_root, where(:parent_id => nil)

  def removable?
    true
  end
  
  def root?
    true
  end
  
end
