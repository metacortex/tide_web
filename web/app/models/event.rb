# == Schema Information
#
# Table name: events
#
#  id             :integer(4)      not null, primary key
#  name           :string(255)
#  body           :text
#  comments_count :integer(4)      default(0)
#  opened_at      :datetime
#  closed_at      :datetime
#  created_at     :datetime
#  updated_at     :datetime
#

class Event < ActiveRecord::Base
  
  has_many :comments, :dependent => :destroy
  
  validates_presence_of :name, :body


end
