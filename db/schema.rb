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

ActiveRecord::Schema.define(version: 20160408071542) do

  create_table "bikers", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "last_name"
    t.string   "bank"
    t.integer  "rut"
    t.string   "ocupation"
    t.string   "acc_type"
    t.integer  "acc_number"
    t.string   "address"
  end

  create_table "client_companies", force: :cascade do |t|
    t.string   "client_companies"
    t.string   "last_name"
    t.string   "contact_name"
    t.string   "company_name"
    t.integer  "rut"
    t.string   "address"
    t.string   "email"
    t.integer  "contact_number"
    t.integer  "payment_day"
    t.string   "ocupation"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "client_people", force: :cascade do |t|
    t.string   "client_people"
    t.string   "last_name"
    t.string   "name"
    t.integer  "rut"
    t.integer  "number"
    t.string   "email"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
