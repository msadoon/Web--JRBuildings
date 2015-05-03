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

ActiveRecord::Schema.define(version: 20140928222531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "building_names", force: true do |t|
    t.string   "buildingname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "buildings", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "streetno"
    t.string   "streetname"
    t.string   "postalcode"
    t.float    "latitude"
    t.float    "longitude"
    t.decimal  "gst"
    t.decimal  "qst"
    t.string   "bname"
  end

  create_table "cheques", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "postdate"
    t.decimal  "amount"
    t.integer  "tenant_id"
  end

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "expenses", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "item1"
    t.string   "item2"
    t.string   "item3"
    t.string   "item4"
    t.string   "item5"
    t.string   "item6"
    t.string   "item7"
    t.string   "item8"
    t.string   "item9"
    t.string   "item10"
    t.decimal  "cost1",        precision: 50, scale: 2
    t.decimal  "cost2",        precision: 50, scale: 2
    t.decimal  "cost3",        precision: 50, scale: 2
    t.decimal  "cost4",        precision: 50, scale: 2
    t.decimal  "cost5",        precision: 50, scale: 2
    t.decimal  "cost6",        precision: 50, scale: 2
    t.decimal  "cost7",        precision: 50, scale: 2
    t.decimal  "cost8",        precision: 50, scale: 2
    t.decimal  "cost9",        precision: 50, scale: 2
    t.decimal  "cost10",       precision: 50, scale: 2
    t.decimal  "yeartotal"
    t.date     "year"
    t.integer  "building_id"
    t.string   "buildinginfo"
    t.date     "yearend"
  end

  create_table "helps", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "gst"
    t.decimal  "qst"
  end

  create_table "properties", force: true do |t|
    t.integer  "building_id"
    t.integer  "number"
    t.string   "suitedfor"
    t.text     "notes"
    t.boolean  "rented"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "buildinginfo"
  end

  create_table "reports", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tenants", force: true do |t|
    t.integer  "propertynumber"
    t.string   "tenantname"
    t.integer  "postgiven"
    t.integer  "posttogive"
    t.decimal  "monthrent"
    t.string   "businesstype"
    t.text     "addterms"
    t.text     "renewterms"
    t.decimal  "monthrentwithtax"
    t.decimal  "yearrentwithtax"
    t.date     "leasestart"
    t.date     "leaseend"
    t.decimal  "pshare"
    t.decimal  "yearlyincrease"
    t.decimal  "additionalrent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "t_address"
    t.string   "t_email"
    t.string   "t_phone"
    t.integer  "property_id"
    t.string   "ltype"
    t.string   "tenantbuildinginfo"
    t.decimal  "gst"
    t.decimal  "qst"
    t.date     "expenseyear"
    t.decimal  "expenseforyear"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text     "description"
    t.string   "mlease_file_name"
    t.string   "mlease_content_type"
    t.integer  "mlease_file_size"
    t.datetime "mlease_updated_at"
    t.string   "expadd_file_name"
    t.string   "expadd_content_type"
    t.integer  "expadd_file_size"
    t.datetime "expadd_updated_at"
    t.boolean  "admin"
  end

end
