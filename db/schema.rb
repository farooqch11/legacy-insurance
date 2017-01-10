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

ActiveRecord::Schema.define(version: 20170108121224) do

  create_table "blogs", force: :cascade do |t|
    t.string   "Title"
    t.text     "Text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faceamounts", force: :cascade do |t|
    t.string   "relationship_status"
    t.integer  "start_age"
    t.integer  "end_age"
    t.decimal  "amount"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "coverage_factor"
    t.string   "prefered_insurance"
  end

  create_table "legacies", force: :cascade do |t|
    t.integer  "age"
    t.integer  "relationship_status"
    t.boolean  "smoker"
    t.decimal  "coverage_amount"
    t.decimal  "monthly_amount"
    t.float    "insurance_years"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "gender"
  end

  create_table "policies", force: :cascade do |t|
    t.string   "Name"
    t.string   "age"
    t.string   "birthday"
    t.string   "address"
    t.string   "StateofBirth"
    t.string   "CityofBirth"
    t.string   "height"
    t.string   "weight"
    t.string   "Licensenumber"
    t.string   "State"
    t.string   "SSN"
    t.string   "Salary"
    t.string   "Agency"
    t.string   "Job"
    t.string   "Doh"
    t.string   "Benefactors"
    t.string   "DateofBirth"
    t.string   "Relationship"
    t.string   "AgeofFather"
    t.string   "AgeofMother"
    t.string   "Living"
    t.string   "AgeofFatherDeath"
    t.string   "AgeofMotherDeath"
    t.string   "cause"
    t.string   "Siblings"
    t.string   "Married"
    t.text     "Medicalinfo"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
  end

  add_index "policies", ["user_id"], name: "index_policies_on_user_id"

  create_table "posts", force: :cascade do |t|
    t.string   "Title"
    t.string   "content"
    t.string   "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pricings", force: :cascade do |t|
    t.integer  "age"
    t.decimal  "pns"
    t.decimal  "sns"
    t.string   "rate_type"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
