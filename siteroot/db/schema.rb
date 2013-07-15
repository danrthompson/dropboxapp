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

ActiveRecord::Schema.define(:version => 20130715040938) do

  create_table "db_users", :force => true do |t|
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "db_users", ["email"], :name => "index_db_users_on_email", :unique => true
  add_index "db_users", ["reset_password_token"], :name => "index_db_users_on_reset_password_token", :unique => true

  create_table "folders", :force => true do |t|
    t.integer  "depth"
    t.text     "label"
    t.integer  "order"
    t.integer  "page_id"
    t.integer  "parent_folder_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "pages", :force => true do |t|
    t.text     "title"
    t.text     "description"
    t.integer  "db_user_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.text     "resources_header"
    t.text     "resources_description"
    t.string   "main_image_file_name"
    t.string   "main_image_content_type"
    t.integer  "main_image_file_size"
    t.datetime "main_image_updated_at"
  end

  create_table "resources", :force => true do |t|
    t.text     "title"
    t.text     "description"
    t.integer  "page_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "resource_file_file_name"
    t.string   "resource_file_content_type"
    t.integer  "resource_file_file_size"
    t.datetime "resource_file_updated_at"
    t.integer  "folder_id"
  end

end
