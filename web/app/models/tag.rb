# == Schema Information
#
# Table name: tags
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Tag < ActiveRecord::Base
  
  has_many :taggings, :dependent => :destroy
  has_many :posts, :through => :taggings, :foreign_key => :post_id
  has_many :users, :through => :taggings, :foreign_key => :user_id
  
  validates_presence_of :name
  validates_length_of :name, :minimum => 1
  validates_uniqueness_of :name

  
end
