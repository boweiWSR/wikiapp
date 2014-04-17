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

ActiveRecord::Schema.define(version: 20140416121345) do

  create_table "archives", force: true do |t|
    t.string   "silk_identifier"
    t.string   "country"
    t.integer  "user_id"
    t.integer  "moderator_id"
    t.string   "status"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "identities", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "full_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company_name"
    t.string   "oauth_token"
    t.string   "oauth_secret"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "submissions", force: true do |t|
    t.string   "silk_identifier"
    t.string   "country",         limit: 200,                     null: false
    t.integer  "user_id"
    t.integer  "moderator_id"
    t.string   "status",          limit: 30,  default: "pending"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "submissions", ["country"], name: "index_submissions_on_country", using: :btree
  add_index "submissions", ["silk_identifier", "status"], name: "index_submissions_on_silk_identifier_and_status", using: :btree
  add_index "submissions", ["user_id"], name: "index_submissions_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.boolean  "ambassador",             default: false
    t.string   "countries"
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["countries"], name: "index_users_on_countries", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
