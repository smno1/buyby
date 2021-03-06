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

ActiveRecord::Schema.define(version: 20150722151337) do

  create_table "addresses", force: :cascade do |t|
    t.string   "postcode"
    t.string   "state"
    t.string   "city"
    t.string   "street"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id"

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.boolean  "read"
    t.integer  "offer_id"
    t.integer  "user_id"
    t.integer  "status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["offer_id"], name: "index_comments_on_offer_id"
  add_index "comments", ["status_id"], name: "index_comments_on_status_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "offers", force: :cascade do |t|
    t.string   "subject"
    t.text     "description"
    t.decimal  "price"
    t.boolean  "read"
    t.integer  "request_id"
    t.integer  "user_id"
    t.integer  "status_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "offers", ["request_id"], name: "index_offers_on_request_id"
  add_index "offers", ["status_id"], name: "index_offers_on_status_id"
  add_index "offers", ["user_id"], name: "index_offers_on_user_id"

  create_table "products", force: :cascade do |t|
    t.string   "img_url"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "recommend_products", force: :cascade do |t|
    t.integer  "product_id"
    t.boolean  "active"
    t.string   "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "recommend_products", ["product_id"], name: "index_recommend_products_on_product_id"

  create_table "requests", force: :cascade do |t|
    t.string   "subject"
    t.string   "description"
    t.integer  "user_id"
    t.boolean  "read"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "status_id"
  end

  add_index "requests", ["status_id"], name: "index_requests_on_status_id"
  add_index "requests", ["user_id"], name: "index_requests_on_user_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "status_type"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "phone_number"
    t.string   "nickname",               default: "", null: false
    t.string   "real_name"
    t.string   "note"
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
    t.string   "other_contact_method"
    t.integer  "current_address_id"
    t.boolean  "comment_notification"
    t.boolean  "offer_notification"
    t.boolean  "gender"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
