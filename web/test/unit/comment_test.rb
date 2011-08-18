# == Schema Information
#
# Table name: comments
#
#  id                        :integer(4)      not null, primary key
#  user_id                   :integer(4)
#  post_id                   :integer(4)
#  body                      :text
#  agreements_count          :integer(4)      default(0)
#  positive_agreements_count :integer(4)      default(0)
#  negative_agreements_count :integer(4)      default(0)
#  created_at                :datetime
#  updated_at                :datetime
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
