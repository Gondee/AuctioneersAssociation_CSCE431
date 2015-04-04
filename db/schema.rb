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

ActiveRecord::Schema.define(version: 20150403181057) do

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
    t.integer  "Date_Joined_TAA"
    t.string   "Pymt_Type"
    t.integer  "Pymt_Amt"
    t.date     "Pymt_Date"
    t.text     "Notes"
    t.boolean  "Added_to_WebBase"
    t.integer  "PAC_Contribution"
    t.integer  "Annual_Convention_CE_Hours"
    t.integer  "Online_CE_Hours"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end
