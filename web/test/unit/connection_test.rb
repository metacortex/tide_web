# == Schema Information
#
# Table name: connections
#
#  id              :integer(4)      not null, primary key
#  user_id         :integer(4)
#  target_id       :integer(4)
#  connection_type :string(255)
#  remark          :string(255)
#  accepted_at     :datetime
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

require 'test_helper'

class ConnectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
