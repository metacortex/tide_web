# == Schema Information
#
# Table name: categories
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  title       :string(255)
#  title_en    :string(255)
#  posts_count :integer(4)      default(0)
#  created_at  :datetime
#  updated_at  :datetime
#

class Category < ActiveRecord::Base
  
  has_many :posts, :dependent => :nullify
  
  validates_presence_of :name, :title
  validates_uniqueness_of :name
  
end
