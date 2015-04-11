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

ActiveRecord::Schema.define(version: 20150411082904) do

  create_table "continueedus", force: :cascade do |t|
    t.float    "Annual_Convention_CE_Hours"
    t.float    "Online_CE_Hours"
    t.integer  "member_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "continueedus", ["member_id"], name: "index_continueedus_on_member_id"

  create_table "members", force: :cascade do |t|
    t.string   "Last_Name"
    t.string   "First_Name"
    t.string   "Company"
    t.integer  "TX_License"
    t.text     "Street1"
    t.string   "City"
    t.string   "State"
    t.integer  "Zip"
    t.string   "Main_Phone"
    t.string   "Main_Email"
    t.string   "Customer_Type"
    t.date     "Date_Joined_TAA"
    t.string   "Pymt_Type"
    t.float    "Pymt_Amt"
    t.date     "Pymt_Date"
    t.text     "Notes"
    t.boolean  "Added_to_WebBase"
    t.float    "PAC_Contribution"
    t.float    "Annual_Convention_CE_Hours"
    t.float    "Online_CE_Hours"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "password_digest"
  end

  create_table "pacs", force: :cascade do |t|
    t.float    "PAC_Contribution"
    t.integer  "member_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "pacs", ["member_id"], name: "index_pacs_on_member_id"

  create_table "payments", force: :cascade do |t|
    t.string   "Pymt_Type"
    t.float    "Pymt_Amt"
    t.date     "Pymt_Date"
    t.integer  "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "payments", ["member_id"], name: "index_payments_on_member_id"

end
