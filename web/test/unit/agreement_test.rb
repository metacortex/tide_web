# == Schema Information
#
# Table name: agreements
#
#  id         :integer(4)      not null, primary key
#  post_id    :integer(4)
#  event_id   :integer(4)
#  comment_id :integer(4)
#  user_id    :integer(4)
#  direction  :integer(4)      default(0)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'test_helper'

class AgreementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
