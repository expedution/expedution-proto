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

ActiveRecord::Schema.define(version: 20160524151952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "category"
    t.datetime "starts_on"
    t.datetime "ends_on"
    t.string   "photo"
    t.string   "adress"
    t.integer  "day_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "activities", ["day_id"], name: "index_activities_on_day_id", using: :btree

  create_table "days", force: :cascade do |t|
    t.integer  "position"
    t.datetime "date"
    t.integer  "expedition_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "days", ["expedition_id"], name: "index_days_on_expedition_id", using: :btree

  create_table "expeditions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.string   "theme"
    t.datetime "starts_on"
    t.datetime "ends_on"
    t.integer  "capacity"
    t.string   "photo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "location"
  end

  add_index "expeditions", ["user_id"], name: "index_expeditions_on_user_id", using: :btree

  create_table "feedbacks", force: :cascade do |t|
    t.text     "content"
    t.integer  "rating"
    t.integer  "user_id"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "feedbacks", ["activity_id"], name: "index_feedbacks_on_activity_id", using: :btree
  add_index "feedbacks", ["user_id"], name: "index_feedbacks_on_user_id", using: :btree

  create_table "participations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "expedition_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "participations", ["expedition_id"], name: "index_participations_on_expedition_id", using: :btree
  add_index "participations", ["user_id"], name: "index_participations_on_user_id", using: :btree

  create_table "ressources", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.string   "photo"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "ressources", ["activity_id"], name: "index_ressources_on_activity_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "photo"
    t.text     "bio"
    t.string   "job"
    t.string   "company"
    t.string   "phone"
    t.string   "diet"
    t.boolean  "organiser",              default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "activities", "days"
  add_foreign_key "days", "expeditions"
  add_foreign_key "expeditions", "users"
  add_foreign_key "feedbacks", "activities"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "participations", "expeditions"
  add_foreign_key "participations", "users"
  add_foreign_key "ressources", "activities"
end
