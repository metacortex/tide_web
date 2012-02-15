# == Schema Information
#
# Table name: banners
#
#  id         :integer(4)      not null, primary key
#  category   :string(255)
#  event_id   :integer(4)
#  body       :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'test_helper'

class BannerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
