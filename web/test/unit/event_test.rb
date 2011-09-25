# == Schema Information
#
# Table name: events
#
#  id             :integer(4)      not null, primary key
#  name           :string(255)
#  body           :text
#  event_type     :string(255)
#  comments_count :integer(4)      default(0)
#  opened_at      :datetime
#  closed_at      :datetime
#  created_at     :datetime
#  updated_at     :datetime
#  picture_image  :string(255)
#  abbr           :text
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
