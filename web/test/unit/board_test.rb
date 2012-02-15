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

require 'test_helper'

class BoardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
