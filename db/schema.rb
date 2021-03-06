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

ActiveRecord::Schema.define(version: 2019_02_20_173807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "occurence_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "aasm_state"
    t.string "stripe_charge_id"
    t.index ["occurence_id"], name: "index_bookings_on_occurence_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "gym_classes", force: :cascade do |t|
    t.string "class_type"
    t.integer "maximum_clients"
    t.text "description"
    t.float "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_gym_classes_on_user_id"
  end

  create_table "occurences", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "gym_class_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "aasm_state"
    t.index ["gym_class_id"], name: "index_occurences_on_gym_class_id"
    t.index ["user_id"], name: "index_occurences_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.date "date_of_birth"
    t.string "role"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "bookings", "occurences"
  add_foreign_key "bookings", "users"
  add_foreign_key "gym_classes", "users"
  add_foreign_key "occurences", "gym_classes"
  add_foreign_key "occurences", "users"
end
