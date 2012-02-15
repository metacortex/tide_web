# == Schema Information
#
# Table name: invitations
#
#  id          :integer(4)      not null, primary key
#  user_id     :integer(4)
#  email       :string(255)
#  kind        :string(255)
#  message     :text
#  code        :string(255)
#  accepted_at :datetime
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
