# == Schema Information
#
# Table name: authentications
#
#  id           :integer(4)      not null, primary key
#  user_id      :integer(4)
#  provider     :string(255)
#  uid          :string(255)
#  access_token :string(255)
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

require 'test_helper'

class AuthenticationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
