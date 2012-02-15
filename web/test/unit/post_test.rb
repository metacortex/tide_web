# == Schema Information
#
# Table name: posts
#
#  id             :integer(4)      not null, primary key
#  user_id        :integer(4)
#  category_id    :integer(4)
#  title          :string(255)
#  title_en       :string(255)
#  body           :text
#  body_en        :text
#  source_url     :string(255)
#  kind           :string(255)
#  picture_image  :string(255)
#  assets_count   :integer(4)      default(0)
#  comments_count :integer(4)      default(0)
#  votes_count    :integer(4)      default(0)
#  pv_count       :integer(4)      default(0)
#  score          :integer(4)      default(0)
#  published_at   :datetime
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#  edit_status    :string(255)
#  edit_note      :text
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
