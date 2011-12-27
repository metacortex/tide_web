# == Schema Information
#
# Table name: taggings
#
#  id           :integer(4)      not null, primary key
#  content_type :string(255)
#  content_id   :integer(4)
#  name         :string(255)
#  category     :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class TaggingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
