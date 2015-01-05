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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150105040610) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: true do |t|
    t.string   "access_token"
    t.datetime "expired_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "choices", force: true do |t|
    t.string   "value"
    t.integer  "poll_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "choices", ["poll_id"], name: "index_choices_on_poll_id", using: :btree

  create_table "polls", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "status"
    t.datetime "expiration_date"
    t.integer  "creator_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "polls", ["creator_user_id"], name: "index_polls_on_creator_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "voters", force: true do |t|
    t.integer "poll_id"
    t.integer "user_id"
  end

  create_table "votes", force: true do |t|
    t.integer  "choice_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "poll_id"
  end

  add_index "votes", ["choice_id"], name: "index_votes_on_choice_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

end
