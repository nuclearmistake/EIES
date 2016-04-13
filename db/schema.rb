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

ActiveRecord::Schema.define(version: 20160413190601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entities", force: :cascade do |t|
    t.string   "name"
    t.string   "domain"
    t.integer  "port"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "entities", ["user_id"], name: "index_entities_on_user_id", using: :btree

  create_table "entity_tokens", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "entity_id"
    t.integer  "key_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "entity_tokens", ["entity_id"], name: "index_entity_tokens_on_entity_id", using: :btree
  add_index "entity_tokens", ["key_id"], name: "index_entity_tokens_on_key_id", using: :btree
  add_index "entity_tokens", ["user_id"], name: "index_entity_tokens_on_user_id", using: :btree

  create_table "keys", force: :cascade do |t|
    t.string   "name"
    t.string   "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "keys", ["user_id"], name: "index_keys_on_user_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
