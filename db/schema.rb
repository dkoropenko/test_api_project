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

ActiveRecord::Schema.define(version: 2018_10_18_135841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "label"
    t.string "theme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.bigint "course_id"
    t.string "label"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_lessons_on_course_id"
  end

  create_table "prices", force: :cascade do |t|
    t.bigint "course_id"
    t.float "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_prices_on_course_id"
  end

  create_table "promo_codes", force: :cascade do |t|
    t.bigint "course_id"
    t.string "identifier"
    t.integer "lessons_size"
    t.integer "days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_promo_codes_on_course_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_promo_codes", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "promo_code_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promo_code_id"], name: "index_users_promo_codes_on_promo_code_id"
    t.index ["user_id"], name: "index_users_promo_codes_on_user_id"
  end

  add_foreign_key "lessons", "courses"
  add_foreign_key "prices", "courses"
  add_foreign_key "promo_codes", "courses"
  add_foreign_key "users_promo_codes", "promo_codes"
  add_foreign_key "users_promo_codes", "users"
end
