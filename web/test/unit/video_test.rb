# == Schema Information
#
# Table name: videos
#
#  id           :integer(4)      not null, primary key
#  title        :string(255)
#  desc         :text
#  vimeo_uid    :string(255)
#  duration     :integer(4)
#  thumb_large  :string(255)
#  thumb_medium :string(255)
#  thumb_small  :string(255)
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
