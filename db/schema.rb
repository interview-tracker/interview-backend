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


ActiveRecord::Schema.define(version: 20150308014608) do

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.integer  "zipcode"
    t.integer  "state"
    t.string   "phone_number"
    t.string   "url"
    t.string   "hr_email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "interviews", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "position_title"
    t.string   "follow_up_email"
    t.datetime "interview_time"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "listing_id"
    t.string   "interviewtype"
    t.boolean  "interviewed",     default: false
    t.text     "notes"
    t.string   "status"
  end

  create_table "listings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "contact_id"
    t.string   "job_title"
    t.boolean  "applied",                 default: false
    t.string   "contact_email"
    t.string   "phone_number"
    t.string   "posting_url"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "interview_id"
    t.string   "company_name"
    t.text     "notes"
    t.boolean  "submitted_resume",        default: false
    t.datetime "date_resume_submitted"
    t.integer  "opportunity_ranking",     default: 0
    t.text     "opportunity_description"
    t.text     "company_summary"
    t.string   "lead_source"
  end

  create_table "resumes", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "name"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authentication_token"
    t.string   "full_name"
    t.integer  "age"
    t.text     "experience"
    t.text     "skills"
    t.text     "education"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
