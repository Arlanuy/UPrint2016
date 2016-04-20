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

ActiveRecord::Schema.define(version: 20160414032751) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string   "lastname",       null: false
    t.string   "firstname",      null: false
    t.string   "email",          null: false
    t.string   "contact_number"
    t.integer  "is_admin"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "documents", force: :cascade do |t|
    t.integer  "transaction_id"
    t.integer  "paper_size",     null: false
    t.boolean  "is_colored",     null: false
    t.string   "filename",       null: false
    t.integer  "num_of_pages",   null: false
    t.integer  "num_of_colored"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string   "shop_name"
    t.string   "location"
    t.string   "email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "contact_number"
    t.text     "pricing"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "queue_status",           default: 0,  null: false
    t.boolean  "is_available"
  end

  add_index "shops", ["confirmation_token"], name: "index_shops_on_confirmation_token", unique: true, using: :btree
  add_index "shops", ["email"], name: "index_shops_on_email", unique: true, using: :btree
  add_index "shops", ["reset_password_token"], name: "index_shops_on_reset_password_token", unique: true, using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "student_number"
    t.string   "email"
    t.string   "contact_number"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "students", ["confirmation_token"], name: "index_students_on_confirmation_token", unique: true, using: :btree
  add_index "students", ["email"], name: "index_students_on_email", unique: true, using: :btree
  add_index "students", ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true, using: :btree

  create_table "transactions", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "shop_id"
    t.datetime "date_sent",         null: false
    t.datetime "date_downloaded"
    t.datetime "date_paid"
    t.float    "price",             null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "paper_size"
    t.string   "color_settings"
    t.text     "additional_specs"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

end
