# == Schema Information
#
# Table name: taggings
#
#  id         :integer(4)      not null, primary key
#  tag_id     :integer(4)
#  user_id    :integer(4)
#  post_id    :integer(4)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class TaggingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
