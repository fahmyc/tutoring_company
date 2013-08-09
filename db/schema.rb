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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130809140930) do

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "contracts", :force => true do |t|
    t.integer  "student_id"
    t.string   "contract_type"
    t.integer  "hours_left"
    t.integer  "tutor_1_id"
    t.integer  "tutor_2_id"
    t.integer  "tutor_3_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.text     "notes"
    t.decimal  "rate"
  end

  create_table "first_sessions", :force => true do |t|
    t.integer  "tutor_id"
    t.integer  "student_id"
    t.string   "date"
    t.string   "result_of_first_session"
    t.text     "notes"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "matches", :force => true do |t|
    t.integer  "student_id"
    t.integer  "tutor_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "students", :force => true do |t|
    t.string   "encrypted_password",          :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",               :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "parent_name"
    t.string   "student_name"
    t.string   "gender"
    t.string   "primary_phone"
    t.string   "secondary_phone"
    t.string   "address"
    t.string   "city"
    t.integer  "grade"
    t.string   "school"
    t.string   "how_they_heard"
    t.string   "tutor_assigned"
    t.integer  "number_of_contracts"
    t.integer  "number_of_one_time_sessions"
    t.text     "notes"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.string   "email"
    t.integer  "admin_id"
    t.string   "courses"
  end

  add_index "students", ["reset_password_token"], :name => "index_students_on_reset_password_token", :unique => true

  create_table "tutor_sessions", :force => true do |t|
    t.integer  "student_id"
    t.integer  "tutor_id"
    t.date     "date"
    t.decimal  "number_of_hours"
    t.text     "notes"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "student_name"
    t.string   "time"
  end

  create_table "tutors", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "grades"
    t.string   "address"
    t.string   "city"
    t.string   "postal_code"
    t.integer  "total_hours_tutored"
    t.text     "notes"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "admin_id"
    t.string   "courses"
    t.string   "primary_phone"
    t.string   "secondary_phone"
  end

  add_index "tutors", ["email"], :name => "index_tutors_on_email", :unique => true
  add_index "tutors", ["reset_password_token"], :name => "index_tutors_on_reset_password_token", :unique => true

end
