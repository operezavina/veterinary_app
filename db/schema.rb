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

ActiveRecord::Schema.define(version: 20131010025115) do

  create_table "appointments", force: true do |t|
    t.date     "visit_date"
    t.boolean  "reminder_appo"
    t.text     "rason_visit"
    t.integer  "doctor_id"
    t.integer  "pet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "appointments", ["doctor_id"], name: "index_appointments_on_doctor_id"
  add_index "appointments", ["pet_id"], name: "index_appointments_on_pet_id"

  create_table "doctors", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "school"
    t.decimal  "experience"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  create_table "pets", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.string   "breed"
    t.decimal  "age"
    t.decimal  "weight"
    t.date     "visit_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "customer"
  end

end
