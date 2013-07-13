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

ActiveRecord::Schema.define(version: 20130713161243) do

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

  create_table "product_colors", force: true do |t|
    t.integer  "color_id"
    t.integer  "master_product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "primary"
  end

  create_table "products", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "master_product_id"
    t.boolean  "primary"
    t.string   "image"
  end

end
