# == Schema Information
#
# Table name: assets
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  source     :string(255)
#  attachment :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'test_helper'

class AssetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
