# == Schema Information
#
# Table name: tags
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  category_id :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

class Tag < ActiveRecord::Base
  
  has_many :taggings, :dependent => :destroy
  belongs_to :category
  
  validates_presence_of :name
  validates_length_of :name, :minimum => 2
  validates_uniqueness_of :name

  
end
