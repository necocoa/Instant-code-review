# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_05_013832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "post_review_likes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "post_review_id", null: false
    t.index ["post_review_id"], name: "index_post_review_likes_on_post_review_id"
    t.index ["user_id", "post_review_id"], name: "index_post_review_likes_on_user_id_and_post_review_id", unique: true
    t.index ["user_id"], name: "index_post_review_likes_on_user_id"
  end

  create_table "post_reviews", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "post_id", null: false
    t.bigint "user_id", null: false
    t.text "body", default: "", null: false
    t.index ["post_id"], name: "index_post_reviews_on_post_id"
    t.index ["user_id"], name: "index_post_reviews_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.string "title", default: "", null: false
    t.text "body", default: "", null: false
    t.index ["created_at"], name: "index_posts_on_created_at"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.text "profile"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "post_review_likes", "post_reviews"
  add_foreign_key "post_review_likes", "users"
  add_foreign_key "post_reviews", "posts"
  add_foreign_key "post_reviews", "users"
  add_foreign_key "posts", "users"
end
