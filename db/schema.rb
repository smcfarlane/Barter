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

ActiveRecord::Schema.define(version: 20150602225101) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer "user_infos_id"
    t.string  "street_address",               null: false
    t.string  "street_address2", default: "", null: false
    t.string  "city",                         null: false
    t.string  "state",                        null: false
    t.string  "zip",                          null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_infos", force: :cascade do |t|
    t.integer  "user_infos_id"
    t.string   "street_address",               null: false
    t.string   "street_address2", default: "", null: false
    t.string   "city",                         null: false
    t.string   "state",                        null: false
    t.string   "zip",                          null: false
    t.string   "phone",           default: "", null: false
    t.string   "email",                        null: false
    t.string   "website",         default: "", null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "emails", force: :cascade do |t|
    t.integer "user_info_id"
    t.string  "email",        null: false
  end

  create_table "phones", force: :cascade do |t|
    t.integer "user_info_id"
    t.string  "phone",        default: "", null: false
  end

  create_table "proposals", force: :cascade do |t|
    t.date     "date_range",                    null: false
    t.integer  "services_id",                   null: false
    t.text     "description",      default: "", null: false
    t.integer  "users_id"
    t.integer  "service_users_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "service_users", force: :cascade do |t|
    t.integer  "users_id",    null: false
    t.integer  "servcies_id", null: false
    t.string   "location",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "name",                       null: false
    t.text     "description", default: "",   null: false
    t.boolean  "active",      default: true, null: false
    t.integer  "category_id",                null: false
    t.integer  "location"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "user_infos", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
