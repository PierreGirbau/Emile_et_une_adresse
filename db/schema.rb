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

ActiveRecord::Schema.define(version: 20180404160840) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "detailed_categories", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_detailed_categories_on_category_id"
    t.index ["detail_id"], name: "index_detailed_categories_on_detail_id"
  end

  create_table "details", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "place_id"
    t.text "comment"
    t.string "season"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_details_on_place_id"
    t.index ["user_id"], name: "index_details_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.boolean "open_now"
    t.string "name"
    t.string "waiting_time"
    t.integer "total_heart"
    t.float "average_price"
    t.string "phone_number"
    t.string "website"
    t.string "address"
    t.string "periods"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type_of_place"
    t.string "google_place_id"
  end

  create_table "saved_places", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "place_id"
    t.boolean "visible"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_saved_places_on_place_id"
    t.index ["user_id"], name: "index_saved_places_on_user_id"
  end

  create_table "shared_places", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "place_id"
    t.boolean "visible"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_shared_places_on_place_id"
    t.index ["user_id"], name: "index_shared_places_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.integer "heart_stock"
    t.integer "heart_capacity"
    t.date "birth_date"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "detailed_categories", "categories"
  add_foreign_key "detailed_categories", "details"
  add_foreign_key "details", "places"
  add_foreign_key "details", "users"
  add_foreign_key "saved_places", "places"
  add_foreign_key "saved_places", "users"
  add_foreign_key "shared_places", "places"
  add_foreign_key "shared_places", "users"
end
