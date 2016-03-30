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

ActiveRecord::Schema.define(version: 20160330004557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "runtime"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "showtime_id"
    t.string   "customer_name"
    t.integer  "credit_card_number"
    t.integer  "credit_card_cvv"
    t.date     "credit_card_expiration"
    t.string   "billing_address_1"
    t.string   "billing_address_2"
    t.integer  "billing_zipcode"
    t.text     "customer_email"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "orders", ["movie_id"], name: "index_orders_on_movie_id", using: :btree
  add_index "orders", ["showtime_id"], name: "index_orders_on_showtime_id", using: :btree

  create_table "showtimes", force: :cascade do |t|
    t.datetime "time"
    t.integer  "movie_id"
    t.integer  "theatre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "showtimes", ["movie_id"], name: "index_showtimes_on_movie_id", using: :btree
  add_index "showtimes", ["theatre_id"], name: "index_showtimes_on_theatre_id", using: :btree

  create_table "theatres", force: :cascade do |t|
    t.integer  "capacity"
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "orders", "movies"
  add_foreign_key "orders", "showtimes"
end
