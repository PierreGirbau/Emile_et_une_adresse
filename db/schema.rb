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

ActiveRecord::Schema.define(version: 20180818101020) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "details", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "place_id"
    t.string "season"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type_of_place"
    t.integer "price"
    t.text "comment"
    t.index ["place_id"], name: "index_details_on_place_id"
    t.index ["user_id"], name: "index_details_on_user_id"
  end

  create_table "places", force: :cascade do |t|
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
    t.string "google_place_id"
    t.string "photo_google"
    t.float "latitude"
    t.float "longitude"
    t.text "comment"
    t.integer "price"
    t.string "type_of_place"
    t.string "photo"
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

  create_table "votes", id: :serial, force: :cascade do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

  add_foreign_key "details", "places"
  add_foreign_key "details", "users"
  add_foreign_key "saved_places", "places"
  add_foreign_key "saved_places", "users"
  add_foreign_key "shared_places", "places"
  add_foreign_key "shared_places", "users"
end
