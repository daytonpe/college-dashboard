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
    t.boolean  "c1",         default: false
    t.boolean  "c2",         default: false
    t.boolean  "c3",         default: false
    t.boolean  "c4",         default: false
    t.boolean  "c5",         default: false
    t.boolean  "c6",         default: false
    t.boolean  "c7",         default: false
    t.boolean  "c8",         default: false
    t.boolean  "c9",         default: false
    t.boolean  "c10",        default: false
    t.boolean  "c11",        default: false
    t.boolean  "c12",        default: false
    t.boolean  "c13",        default: false
    t.boolean  "c14",        default: false
    t.boolean  "c15",        default: false
    t.boolean  "c16",        default: false
    t.boolean  "c17",        default: false
    t.boolean  "c18",        default: false
    t.boolean  "c19",        default: false
    t.boolean  "c20",        default: false
    t.boolean  "c21",        default: false
    t.boolean  "c22",        default: false
    t.boolean  "c23",        default: false
    t.boolean  "c24",        default: false
    t.boolean  "c25",        default: false
    t.boolean  "c26",        default: false
    t.boolean  "c27",        default: false
    t.boolean  "c28",        default: false
    t.boolean  "c29",        default: false
    t.boolean  "c30",        default: false
    t.boolean  "c31",        default: false
    t.boolean  "c32",        default: false
    t.boolean  "c33",        default: false
    t.boolean  "c34",        default: false
    t.boolean  "c35",        default: false
    t.boolean  "c36",        default: false
    t.boolean  "c37",        default: false
    t.integer  "count",      default: 0
    t.integer  "user_id"
    t.integer  "college_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
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
