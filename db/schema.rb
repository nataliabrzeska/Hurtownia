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

ActiveRecord::Schema.define(version: 20180613180707) do

  create_table "categories", force: true do |t|
    t.string   "name",       limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "product_id"
    t.string   "status",     limit: 60
    t.string   "name",       limit: 60
    t.string   "lastName",   limit: 50
    t.string   "address",    limit: 30
    t.integer  "telephone",  limit: 50
    t.string   "email",      limit: 50
    t.integer  "quantity",              default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["product_id"], name: "index_orders_on_product_id"

  create_table "pictures", force: true do |t|
    t.string   "name",                 limit: 60
    t.string   "category",             limit: 30
    t.string   "description",          limit: 50
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name",                 limit: 60
    t.float    "price",                limit: 50
    t.string   "description",          limit: 50
    t.string   "category_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id"

  create_table "users", force: true do |t|
    t.string   "firstName",       limit: 20
    t.string   "lastName",        limit: 60
    t.string   "user",            limit: 25
    t.string   "email",           limit: 100
    t.string   "address",         limit: 60
    t.string   "street",          limit: 50
    t.integer  "phone",           limit: 70
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["user"], name: "index_users_on_user"

end
