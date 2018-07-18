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

ActiveRecord::Schema.define(version: 20180717063155) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: ""
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "category_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "iines", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_iines_on_item_id"
    t.index ["user_id", "item_id"], name: "index_iines_on_user_id_and_item_id", unique: true
    t.index ["user_id"], name: "index_iines_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "admin_id", null: false
    t.text "item_image_id", null: false
    t.string "title", null: false
    t.integer "category_id", null: false
    t.integer "maker_id", null: false
    t.integer "price", null: false
    t.string "calorie", null: false
    t.text "comment", null: false
    t.string "age", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "iines_count", default: 0, null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "makers", force: :cascade do |t|
    t.string "maker_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "following_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follower_id", "following_id"], name: "index_relationships_on_follower_id_and_following_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
    t.index ["following_id"], name: "index_relationships_on_following_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "item_id", null: false
    t.integer "star", default: 0, null: false
    t.text "item_review", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "review_star"
    t.integer "star2", default: 0, null: false
    t.integer "star3", default: 0, null: false
    t.integer "review_star2"
    t.integer "review_star3"
    t.integer "like_count"
    t.integer "star4", default: 0, null: false
    t.integer "star5", default: 0, null: false
    t.integer "review_star4"
    t.integer "review_star5"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name", null: false
    t.integer "age", null: false
    t.text "user_image_id"
    t.integer "sex", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
