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

ActiveRecord::Schema.define(version: 20160421213103) do

  create_table "railway_stations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes_stations", force: :cascade do |t|
    t.integer  "railway_station_id"
    t.integer  "route_id"
    t.integer  "position"
    t.datetime "arrive_time"
    t.datetime "departure_time"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "number"
    t.integer  "train_id"
    t.integer  "user_id"
    t.integer  "railway_station_first_id"
    t.integer  "railway_station_last_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "owner"
    t.string   "passport"
  end

  create_table "trains", force: :cascade do |t|
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "route_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wagons", force: :cascade do |t|
    t.integer  "number"
    t.integer  "train_id"
    t.integer  "up_seats"
    t.integer  "down_seats"
    t.integer  "side_top_seats"
    t.integer  "side_bottom_seats"
    t.integer  "seat_place"
    t.string   "type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end
