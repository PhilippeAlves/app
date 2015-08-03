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

ActiveRecord::Schema.define(version: 20150803130223) do

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "check_points", force: :cascade do |t|
    t.date     "hour"
    t.integer  "frequency_id"
    t.integer  "room_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "check_points", ["frequency_id"], name: "index_check_points_on_frequency_id"
  add_index "check_points", ["room_id"], name: "index_check_points_on_room_id"

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "institution_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "departments", ["institution_id"], name: "index_departments_on_institution_id"

  create_table "floors", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "frequencies", force: :cascade do |t|
    t.date     "date"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "frequencies", ["user_id"], name: "index_frequencies_on_user_id"

  create_table "institutions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "room_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "properties", ["room_id"], name: "index_properties_on_room_id"

  create_table "property_reservations", force: :cascade do |t|
    t.boolean  "returned"
    t.integer  "property_id"
    t.integer  "reservation_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "property_reservations", ["property_id"], name: "index_property_reservations_on_property_id"
  add_index "property_reservations", ["reservation_id"], name: "index_property_reservations_on_reservation_id"

  create_table "reservations", force: :cascade do |t|
    t.date     "date"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id"

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "permission_id"
    t.integer  "floor_id"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "rooms", ["department_id"], name: "index_rooms_on_department_id"
  add_index "rooms", ["floor_id"], name: "index_rooms_on_floor_id"
  add_index "rooms", ["permission_id"], name: "index_rooms_on_permission_id"

  create_table "shifts", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "begin"
    t.datetime "end"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_frequencies", force: :cascade do |t|
    t.datetime "date"
    t.integer  "user_id"
    t.string   "type_frequency"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "user_frequencies", ["user_id"], name: "index_user_frequencies_on_user_id"

  create_table "user_group_permissions", force: :cascade do |t|
    t.integer  "user_group_id"
    t.integer  "permission_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "user_group_permissions", ["permission_id"], name: "index_user_group_permissions_on_permission_id"
  add_index "user_group_permissions", ["user_group_id"], name: "index_user_group_permissions_on_user_group_id"

  create_table "user_groups", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "card"
    t.date     "birthday"
    t.string   "cpf"
    t.string   "rg"
    t.integer  "user_group_id"
    t.integer  "shift_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "users", ["shift_id"], name: "index_users_on_shift_id"
  add_index "users", ["user_group_id"], name: "index_users_on_user_group_id"

end
