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

ActiveRecord::Schema.define(:version => 20130217164125) do

  create_table "debts", :force => true do |t|
    t.integer  "debtor_id"
    t.integer  "creditor_id"
    t.integer  "pact_id"
    t.integer  "amount"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.boolean  "marked_as_paid_by_creditor"
    t.boolean  "marked_as_paid_by_debtor"
  end

  create_table "pacts", :force => true do |t|
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.datetime "last_processed_at"
  end

  create_table "pacts_users", :id => false, :force => true do |t|
    t.integer "pact_id"
    t.integer "user_id"
  end

  add_index "pacts_users", ["pact_id"], :name => "index_pacts_users_on_pact_id"
  add_index "pacts_users", ["user_id"], :name => "index_pacts_users_on_user_id"

  create_table "posts", :force => true do |t|
    t.integer  "rss_feed_id"
    t.string   "title"
    t.string   "snippet"
    t.string   "url"
    t.datetime "published_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "rss_feeds", :force => true do |t|
    t.integer  "user_id"
    t.string   "url"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
