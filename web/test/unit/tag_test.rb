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

require 'test_helper'

class TagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
