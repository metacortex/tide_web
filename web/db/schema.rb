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

ActiveRecord::Schema.define(:version => 20110925115132) do

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

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
    t.integer  "post_id"
    t.text     "body"
    t.integer  "agreements_count",          :default => 0
    t.integer  "positive_agreements_count", :default => 0
    t.integer  "negative_agreements_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
  end

  add_index "comments", ["event_id"], :name => "index_comments_on_event_id"
  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"
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
    t.string   "event_type"
    t.integer  "comments_count", :default => 0
    t.datetime "opened_at"
    t.datetime "closed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_image"
    t.text     "abbr"
  end

  add_index "events", ["event_type"], :name => "index_events_on_event_type"

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
    t.string   "picture_image"
  end

  add_index "posts", ["category_id"], :name => "index_posts_on_category_id"
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "registrations", ["event_id"], :name => "index_registrations_on_event_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "user_id"
    t.integer  "post_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["post_id"], :name => "index_taggings_on_post_id"
  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["user_id"], :name => "index_taggings_on_user_id"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], :name => "index_tags_on_name", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name_e"
    t.string   "location"
    t.string   "category"
    t.text     "website"
    t.string   "work"
    t.string   "interest"
    t.string   "profile_image"
    t.integer  "connections_count",                     :default => 0
    t.integer  "posts_count",                           :default => 0
    t.integer  "comments_count",                        :default => 0
    t.integer  "agreements_count",                      :default => 0
    t.integer  "votes_count",                           :default => 0
    t.integer  "score_all",                             :default => 0
    t.integer  "score_total",                           :default => 0
    t.integer  "score_week",                            :default => 0
    t.text     "score"
    t.integer  "ranking_all",                           :default => 0
    t.integer  "ranking_total",                         :default => 0
    t.integer  "ranking_week",                          :default => 0
  end

  add_index "users", ["category"], :name => "index_users_on_category"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name"
  add_index "users", ["name_e"], :name => "index_users_on_name_e"
  add_index "users", ["ranking_all"], :name => "index_users_on_ranking_all"
  add_index "users", ["ranking_total"], :name => "index_users_on_ranking_total"
  add_index "users", ["ranking_week"], :name => "index_users_on_ranking_week"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["score_all"], :name => "index_users_on_score_all"
  add_index "users", ["score_total"], :name => "index_users_on_score_total"
  add_index "users", ["score_week"], :name => "index_users_on_score_week"

end
