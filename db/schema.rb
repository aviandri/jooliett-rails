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

ActiveRecord::Schema.define(version: 20130721184850) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "cart_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts_products", force: true do |t|
    t.integer "cart_id"
    t.integer "product_id"
  end

  create_table "categories", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "categories_master_products", force: true do |t|
    t.integer "categories_id"
    t.integer "master_products_id"
    t.integer "master_product_id"
    t.integer "category_id"
  end

  create_table "colors", force: true do |t|
    t.string   "name"
    t.string   "hex"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "master_products", force: true do |t|
    t.string   "name"
    t.integer  "price"
    t.string   "description"
    t.integer  "discount_price"
    t.string   "discount_percentage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "master_products_categories", force: true do |t|
    t.integer "categories_id"
    t.integer "master_products_id"
  end

  create_table "master_products_product_sizes", force: true do |t|
    t.integer "master_product_id"
    t.integer "product_size_id"
  end

  create_table "order_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
  end

  create_table "orders", force: true do |t|
    t.integer  "shipping_detail_id"
    t.integer  "payment_detail_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "total_price"
    t.string   "status"
  end

  create_table "payment_codes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_details", force: true do |t|
    t.integer  "payment_type_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "payment_code_id"
  end

  create_table "payment_types", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "product_colors", force: true do |t|
    t.integer  "color_id"
    t.integer  "master_product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "primary"
  end

  create_table "product_images", force: true do |t|
    t.string   "image"
    t.boolean  "primary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_color_id"
  end

  create_table "product_sizes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
  end

  create_table "products", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "master_product_id"
    t.integer  "product_color_id"
    t.integer  "product_size_id"
    t.integer  "quantity"
  end

  create_table "shipping_details", force: true do |t|
    t.string   "name"
    t.string   "mobile"
    t.string   "country"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "postal_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "price",       default: 0
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
