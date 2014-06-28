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

ActiveRecord::Schema.define(version: 20140628160640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "basket_items", force: true do |t|
    t.integer  "basket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "basket_items", ["basket_id"], name: "index_basket_items_on_basket_id", using: :btree

  create_table "baskets", force: true do |t|
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "baskets", ["parent_id"], name: "index_baskets_on_parent_id", using: :btree

  create_table "camp_registrations", force: true do |t|
    t.integer  "camp_session_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
  end

  add_index "camp_registrations", ["camp_session_id"], name: "index_camp_registrations_on_camp_session_id", using: :btree
  add_index "camp_registrations", ["parent_id"], name: "index_camp_registrations_on_parent_id", using: :btree
  add_index "camp_registrations", ["player_id"], name: "index_camp_registrations_on_player_id", using: :btree

  create_table "camp_sessions", force: true do |t|
    t.integer  "camp_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "price"
  end

  create_table "camps", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
    t.integer  "num_of_attendees"
  end

  create_table "coaches", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "bio"
    t.string   "gravatar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.integer  "camp_id"
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parents", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mobile_number"
    t.string   "home_phone_number"
  end

  add_index "parents", ["email"], name: "index_parents_on_email", unique: true, using: :btree
  add_index "parents", ["reset_password_token"], name: "index_parents_on_reset_password_token", unique: true, using: :btree

  create_table "players", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "dob"
    t.string   "club"
    t.string   "experience"
    t.string   "gender"
    t.string   "medical"
    t.string   "allergies"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.integer  "standard_id"
  end

  add_index "players", ["parent_id"], name: "index_players_on_parent_id", using: :btree
  add_index "players", ["standard_id"], name: "index_players_on_standard_id", using: :btree

  create_table "standards", force: true do |t|
    t.string   "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
