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
#  assets_count   :integer(4)      default(0)
#  taggings_count :integer(4)      default(0)
#  comments_count :integer(4)      default(0)
#  votes_count    :integer(4)      default(0)
#  t_votes_count  :integer(4)      default(0)
#  d_votes_count  :integer(4)      default(0)
#  e_votes_count  :integer(4)      default(0)
#  visits_count   :integer(4)      default(0)
#  score          :integer(4)      default(0)
#  published_at   :datetime
#  created_at     :datetime
#  updated_at     :datetime
#  picture_image  :string(255)
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
