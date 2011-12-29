# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111028131320) do

  create_table "agreements", :force => true do |t|
    t.integer  "post_id"
    t.integer  "event_id"
    t.integer  "comment_id"
    t.integer  "user_id"
    t.integer  "direction",  :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "agreements", ["comment_id"], :name => "index_agreements_on_comment_id"
  add_index "agreements", ["event_id"], :name => "index_agreements_on_event_id"
  add_index "agreements", ["post_id"], :name => "index_agreements_on_post_id"
  add_index "agreements", ["user_id"], :name => "index_agreements_on_user_id"

  create_table "authentications", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "provider",   :null => false
    t.string   "uid",        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banners", :force => true do |t|
    t.string   "category"
    t.integer  "event_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "banners", ["category"], :name => "index_banners_on_category"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "title_en"
    t.integer  "posts_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["name"], :name => "index_categories_on_name"

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.string   "content_type"
    t.integer  "content_id"
    t.text     "body"
    t.integer  "agreements_count",          :default => 0
    t.integer  "positive_agreements_count", :default => 0
    t.integer  "negative_agreements_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["content_type", "content_id"], :name => "index_comments_on_content_type_and_content_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "connections", :force => true do |t|
    t.integer  "user_id"
    t.integer  "target_id"
    t.string   "connection_type"
    t.string   "remark"
    t.datetime "accepted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "connections", ["connection_type"], :name => "index_connections_on_connection_type"
  add_index "connections", ["target_id"], :name => "index_connections_on_target_id"
  add_index "connections", ["user_id"], :name => "index_connections_on_user_id"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "body"
    t.text     "abbr"
    t.string   "poster_image"
    t.string   "thumb_image"
    t.string   "picture_image"
    t.string   "category"
    t.string   "status"
    t.integer  "comments_count", :default => 0
    t.datetime "opened_at"
    t.datetime "closed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["category"], :name => "index_events_on_category"
  add_index "events", ["closed_at"], :name => "index_events_on_closed_at"
  add_index "events", ["name"], :name => "index_events_on_name"
  add_index "events", ["opened_at"], :name => "index_events_on_opened_at"

  create_table "invitations", :force => true do |t|
    t.integer  "user_id"
    t.string   "email"
    t.string   "kind"
    t.text     "message"
    t.string   "code"
    t.datetime "accepted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invitations", ["code"], :name => "index_invitations_on_code"
  add_index "invitations", ["email"], :name => "index_invitations_on_email"
  add_index "invitations", ["user_id"], :name => "index_invitations_on_user_id"

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "title"
    t.string   "title_en"
    t.text     "body"
    t.text     "body_en"
    t.string   "source_url"
    t.string   "kind"
    t.string   "picture_image"
    t.integer  "assets_count",   :default => 0
    t.integer  "taggings_count", :default => 0
    t.integer  "comments_count", :default => 0
    t.integer  "votes_count",    :default => 0
    t.integer  "t_votes_count",  :default => 0
    t.integer  "d_votes_count",  :default => 0
    t.integer  "e_votes_count",  :default => 0
    t.integer  "visits_count",   :default => 0
    t.integer  "score",          :default => 0
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "edit_status"
    t.text     "edit_note"
  end

  add_index "posts", ["category_id"], :name => "index_posts_on_category_id"
  add_index "posts", ["edit_status"], :name => "index_posts_on_edit_status"
  add_index "posts", ["published_at"], :name => "index_posts_on_published_at"
  add_index "posts", ["score"], :name => "index_posts_on_score"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "registrations", :force => true do |t|
    t.integer  "event_id"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.text     "desc"
    t.string   "status"
    t.string   "reg_type"
    t.string   "attachment"
    t.string   "asset"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "registrations", ["event_id"], :name => "index_registrations_on_event_id"

  create_table "taggings", :force => true do |t|
    t.string   "content_type"
    t.integer  "content_id"
    t.integer  "tag_id"
    t.string   "name"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["category"], :name => "index_taggings_on_category"
  add_index "taggings", ["content_type", "content_id"], :name => "index_taggings_on_content_type_and_content_id"
  add_index "taggings", ["name"], :name => "index_taggings_on_name"
  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["category_id"], :name => "index_tags_on_category_id"
  add_index "tags", ["name"], :name => "index_tags_on_name", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "name"
    t.string   "name_e"
    t.text     "work"
    t.text     "vision"
    t.text     "skills"
    t.text     "desc"
    t.string   "profile_image"
    t.string   "website"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "googleplus"
    t.string   "linkedin"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "connections_count",               :default => 0
    t.integer  "posts_count",                     :default => 0
    t.integer  "comments_count",                  :default => 0
    t.integer  "agreements_count",                :default => 0
    t.integer  "votes_count",                     :default => 0
    t.integer  "rank",                            :default => 0
    t.integer  "ranking",                         :default => 0
    t.integer  "score",                           :default => 0
    t.integer  "score_week",                      :default => 0
    t.integer  "score_month",                     :default => 0
    t.integer  "score_year",                      :default => 0
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["name"], :name => "index_users_on_name"
  add_index "users", ["name_e"], :name => "index_users_on_name_e"
  add_index "users", ["rank"], :name => "index_users_on_rank"
  add_index "users", ["ranking"], :name => "index_users_on_ranking"
  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"
  add_index "users", ["score"], :name => "index_users_on_score"
  add_index "users", ["score_month"], :name => "index_users_on_score_month"
  add_index "users", ["score_week"], :name => "index_users_on_score_week"
  add_index "users", ["score_year"], :name => "index_users_on_score_year"

end
