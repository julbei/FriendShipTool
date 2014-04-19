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

ActiveRecord::Schema.define(version: 20140418203059) do

  create_table "accountings", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "group_id"
    t.integer  "person_id"
    t.decimal  "amount"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accountings", ["group_id"], name: "index_accountings_on_group_id"
  add_index "accountings", ["person_id"], name: "index_accountings_on_person_id"

  create_table "groups", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "group_id"
    t.decimal  "balance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people", ["group_id"], name: "index_people_on_group_id"
  add_index "people", ["user_id"], name: "index_people_on_user_id"

  create_table "shares", force: true do |t|
    t.integer  "accounting_id"
    t.integer  "lender_id"
    t.integer  "borrower_id"
    t.decimal  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shares", ["accounting_id"], name: "index_shares_on_accounting_id"

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "accounting_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["accounting_id"], name: "index_taggings_on_accounting_id"
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"

  create_table "tags", force: true do |t|
    t.string   "name"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["group_id"], name: "index_tags_on_group_id"

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
