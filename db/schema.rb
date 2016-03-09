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

ActiveRecord::Schema.define(version: 20160309155846) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "festival_days", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "finish_date"
    t.integer  "festival_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "festival_days", ["festival_id"], name: "index_festival_days_on_festival_id", using: :btree

  create_table "festivals", force: :cascade do |t|
    t.string   "name"
    t.integer  "year"
    t.integer  "organizer_id"
    t.datetime "start_date"
    t.datetime "finish_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "festivals", ["organizer_id"], name: "index_festivals_on_organizer_id", using: :btree

  create_table "organizers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "performances", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "festival_day_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "performances", ["artist_id"], name: "index_performances_on_artist_id", using: :btree
  add_index "performances", ["festival_day_id"], name: "index_performances_on_festival_day_id", using: :btree

  create_table "playlists", force: :cascade do |t|
    t.string   "type"
    t.string   "link"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "playlists", ["user_id"], name: "index_playlists_on_user_id", using: :btree

  create_table "spotifies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "uid"
    t.string   "name"
    t.string   "provider"
    t.string   "image_url"
    t.string   "rspotify_hash"
  end

end
