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

ActiveRecord::Schema.define(version: 20160825204417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checklists", force: :cascade do |t|
    t.boolean  "c1"
    t.boolean  "c2"
    t.boolean  "c3"
    t.boolean  "c4"
    t.boolean  "c5"
    t.boolean  "c6"
    t.boolean  "c7"
    t.boolean  "c8"
    t.boolean  "c9"
    t.boolean  "c10"
    t.boolean  "c11"
    t.boolean  "c12"
    t.boolean  "c13"
    t.boolean  "c14"
    t.boolean  "c15"
    t.boolean  "c16"
    t.boolean  "c17"
    t.boolean  "c18"
    t.boolean  "c19"
    t.boolean  "c20"
    t.boolean  "c21"
    t.boolean  "c22"
    t.boolean  "c23"
    t.boolean  "c24"
    t.boolean  "c25"
    t.boolean  "c26"
    t.boolean  "c27"
    t.boolean  "c28"
    t.boolean  "c29"
    t.boolean  "c30"
    t.boolean  "c31"
    t.boolean  "c32"
    t.boolean  "c33"
    t.boolean  "c34"
    t.boolean  "c35"
    t.boolean  "c36"
    t.boolean  "c37"
    t.integer  "count"
    t.integer  "user_id"
    t.integer  "college_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_id"], name: "index_checklists_on_college_id", using: :btree
    t.index ["user_id"], name: "index_checklists_on_user_id", using: :btree
  end

  create_table "colleges", force: :cascade do |t|
    t.string   "name"
    t.string   "web_page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "country"
    t.string   "tier"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
  end

  create_table "colleges_users", id: false, force: :cascade do |t|
    t.integer "college_id", null: false
    t.integer "user_id",    null: false
  end

  create_table "notes", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "college_id"
    t.integer  "user_id"
    t.index ["college_id"], name: "index_notes_on_college_id", using: :btree
    t.index ["user_id"], name: "index_notes_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "checklists", "colleges"
  add_foreign_key "checklists", "users"
  add_foreign_key "notes", "colleges"
  add_foreign_key "notes", "users"
end
