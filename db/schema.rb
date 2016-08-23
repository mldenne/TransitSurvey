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

ActiveRecord::Schema.define(version: 20160823212158) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "communities", force: :cascade do |t|
    t.string   "city"
    t.float    "lat"
    t.float    "lng"
    t.integer  "range",      default: 5
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "commutes", force: :cascade do |t|
    t.string   "origin"
    t.string   "destination"
    t.integer  "distance_in_miles"
    t.integer  "drive_time_in_minutes"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "distance_per_day"
    t.integer  "distance_per_week"
    t.integer  "drive_minutes_per_week"
    t.integer  "drive_hours_per_week"
    t.integer  "drive_days_per_year"
    t.integer  "drive_cost_per_week"
    t.integer  "drive_cost_per_year"
    t.float    "lat"
    t.float    "lng"
  end

  create_table "points", force: :cascade do |t|
    t.float    "lat"
    t.float    "lng"
    t.integer  "commute_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commute_id"], name: "index_points_on_commute_id", using: :btree
  end

  create_table "textfiles", force: :cascade do |t|
    t.string   "filename"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "points", "commutes"
end
