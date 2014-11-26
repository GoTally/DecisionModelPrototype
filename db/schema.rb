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

ActiveRecord::Schema.define(version: 20141126043307) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "polls", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "status"
    t.string   "type"
    t.datetime "expiration_date"
    t.integer  "creator_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "polls", ["creator_user_id"], name: "index_polls_on_creator_user_id", using: :btree
  add_index "polls", ["type"], name: "index_polls_on_type", using: :btree

  create_table "polls_users", id: false, force: true do |t|
    t.integer "poll_id", null: false
    t.integer "user_id", null: false
  end

  add_index "polls_users", ["poll_id"], name: "index_polls_users_on_poll_id", using: :btree
  add_index "polls_users", ["user_id"], name: "index_polls_users_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string "first_name"
    t.string "last_name"
  end

end
