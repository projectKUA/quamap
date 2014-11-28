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

ActiveRecord::Schema.define(version: 20141128161611) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "quas", force: true do |t|
    t.string   "name"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "quality"
    t.string   "effect"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "stay_required"
    t.integer  "price"
    t.string   "image1_caption"
    t.binary   "image1"
    t.string   "image2_caption"
    t.binary   "image2"
    t.string   "image3_caption"
    t.binary   "image3"
  end

  create_table "reviews", force: true do |t|
    t.integer  "qua_id"
    t.integer  "total_score"
    t.integer  "quality_score"
    t.integer  "convinience_score"
    t.integer  "cost_score"
    t.integer  "sight_score"
    t.string   "comment"
    t.binary   "photo_data"
    t.string   "photo_title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "nickname"
    t.string   "email"
  end

  add_index "reviews", ["qua_id"], name: "index_reviews_on_qua_id", using: :btree

end
