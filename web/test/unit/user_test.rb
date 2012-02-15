# == Schema Information
#
# Table name: users
#
#  id                              :integer(4)      not null, primary key
#  email                           :string(255)
#  crypted_password                :string(255)
#  salt                            :string(255)
#  remember_me_token               :string(255)
#  remember_me_token_expires_at    :datetime
#  reset_password_token            :string(255)
#  reset_password_token_expires_at :datetime
#  reset_password_email_sent_at    :datetime
#  name                            :string(255)
#  name_en                         :string(255)
#  work                            :string(255)
#  vision                          :text
#  skills                          :text
#  desc                            :text
#  profile_image                   :string(255)
#  url_website                     :string(255)
#  url_facebook                    :string(255)
#  url_twitter                     :string(255)
#  url_googleplus                  :string(255)
#  url_linkedin                    :string(255)
#  role                            :string(255)
#  created_at                      :datetime        not null
#  updated_at                      :datetime        not null
#  connections_count               :integer(4)      default(0)
#  posts_count                     :integer(4)      default(0)
#  comments_count                  :integer(4)      default(0)
#  agreements_count                :integer(4)      default(0)
#  votes_count                     :integer(4)      default(0)
#  rank                            :integer(4)      default(0)
#  ranking                         :integer(4)      default(0)
#  score                           :integer(4)      default(0)
#  score_week                      :integer(4)      default(0)
#  score_month                     :integer(4)      default(0)
#  score_year                      :integer(4)      default(0)
#  points                          :text
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
