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

ActiveRecord::Schema.define(version: 20150227032057) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "addressable_id",   limit: 4
    t.string   "addressable_type", limit: 255
    t.string   "country",          limit: 255, default: ""
    t.string   "province",         limit: 255, default: ""
    t.string   "city",             limit: 255, default: ""
    t.string   "district",         limit: 255, default: ""
    t.string   "details",          limit: 255, default: ""
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "zip_code",         limit: 4,   default: 0
    t.datetime "deleted_at"
  end

  add_index "addresses", ["addressable_id", "addressable_type"], name: "index_addresses_on_addressable_id_and_addressable_type", using: :btree
  add_index "addresses", ["deleted_at"], name: "index_addresses_on_deleted_at", using: :btree

  create_table "badnesses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "deleted_at", limit: 4
  end

  add_index "badnesses", ["deleted_at"], name: "index_badnesses_on_deleted_at", using: :btree

  create_table "colors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "value",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "colors", ["value"], name: "index_colors_on_value", using: :btree

  create_table "consumption_records", force: :cascade do |t|
    t.integer  "customer_id",    limit: 4
    t.integer  "payment_method", limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.text     "remark",         limit: 65535
    t.integer  "raw_amount",     limit: 4,     default: 0
  end

  create_table "flaws", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "deleted_at", limit: 4
  end

  add_index "flaws", ["deleted_at"], name: "index_flaws_on_deleted_at", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "type",        limit: 255
    t.string   "brand",       limit: 255
    t.string   "style",       limit: 255
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.datetime "deleted_at"
    t.integer  "color_id",    limit: 4
    t.string   "color",       limit: 255
    t.integer  "customer_id", limit: 4
    t.integer  "scale",       limit: 4,   default: 0
  end

  add_index "items", ["brand"], name: "index_items_on_brand", using: :btree
  add_index "items", ["customer_id"], name: "index_items_on_customer_id", using: :btree
  add_index "items", ["deleted_at"], name: "index_items_on_deleted_at", using: :btree
  add_index "items", ["style"], name: "index_items_on_style", using: :btree
  add_index "items", ["type"], name: "index_items_on_type", using: :btree

  create_table "maintain_parts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "deleted_at", limit: 4
  end

  add_index "maintain_parts", ["deleted_at"], name: "index_maintain_parts_on_deleted_at", using: :btree

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer  "resource_owner_id", limit: 4,    null: false
    t.integer  "application_id",    limit: 4,    null: false
    t.string   "token",             limit: 255,  null: false
    t.integer  "expires_in",        limit: 4,    null: false
    t.string   "redirect_uri",      limit: 2048, null: false
    t.datetime "created_at",                     null: false
    t.datetime "revoked_at"
    t.string   "scopes",            limit: 255
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id", limit: 4
    t.integer  "application_id",    limit: 4,   null: false
    t.string   "token",             limit: 255, null: false
    t.string   "refresh_token",     limit: 255
    t.integer  "expires_in",        limit: 4
    t.datetime "revoked_at"
    t.datetime "created_at",                    null: false
    t.string   "scopes",            limit: 255
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",         limit: 255,               null: false
    t.string   "uid",          limit: 255,               null: false
    t.string   "secret",       limit: 255,               null: false
    t.string   "redirect_uri", limit: 2048,              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "scopes",       limit: 255,  default: "", null: false
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

  create_table "order_statuses", force: :cascade do |t|
    t.integer  "status",     limit: 4, default: 0
    t.integer  "order_id",   limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "order_statuses", ["order_id"], name: "index_order_statuses_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "number",                limit: 255
    t.date     "receive_date"
    t.integer  "store_id",              limit: 4,                     null: false
    t.integer  "customer_id",           limit: 4,                     null: false
    t.date     "delivery_date"
    t.integer  "delivery_manner",       limit: 4,     default: 0
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.integer  "address_id",            limit: 4
    t.datetime "deleted_at"
    t.integer  "status",                limit: 4,     default: 0
    t.integer  "maintain_part_id",      limit: 4
    t.integer  "service_id",            limit: 4
    t.integer  "flaw_id",               limit: 4
    t.integer  "badness_id",            limit: 4
    t.integer  "item_id",               limit: 4,                     null: false
    t.boolean  "urgent",                limit: 1,     default: false
    t.string   "maintain_part",         limit: 255,   default: ""
    t.string   "flaw",                  limit: 255,   default: ""
    t.string   "badness",               limit: 255,   default: ""
    t.string   "attachment",            limit: 255,   default: ""
    t.integer  "consumption_record_id", limit: 4
    t.string   "color",                 limit: 255
    t.string   "service_ids",           limit: 255,   default: ""
    t.integer  "pickup_manner",         limit: 4,     default: 0
    t.text     "request",               limit: 65535
  end

  add_index "orders", ["address_id"], name: "index_orders_on_address_id", using: :btree
  add_index "orders", ["badness_id"], name: "index_orders_on_badness_id", using: :btree
  add_index "orders", ["consumption_record_id"], name: "index_orders_on_consumption_record_id", using: :btree
  add_index "orders", ["deleted_at"], name: "index_orders_on_deleted_at", using: :btree
  add_index "orders", ["delivery_date"], name: "index_orders_on_delivery_date", using: :btree
  add_index "orders", ["flaw_id"], name: "index_orders_on_flaw_id", using: :btree
  add_index "orders", ["item_id"], name: "index_orders_on_item_id", using: :btree
  add_index "orders", ["maintain_part_id"], name: "index_orders_on_maintain_part_id", using: :btree
  add_index "orders", ["number"], name: "index_orders_on_number", using: :btree
  add_index "orders", ["receive_date"], name: "index_orders_on_receive_date", using: :btree
  add_index "orders", ["service_id"], name: "index_orders_on_service_id", using: :btree
  add_index "orders", ["status"], name: "index_orders_on_status", using: :btree
  add_index "orders", ["store_id"], name: "index_orders_on_store_id", using: :btree
  add_index "orders", ["urgent"], name: "index_orders_on_urgent", using: :btree

  create_table "phone_numbers", force: :cascade do |t|
    t.string   "phone",       limit: 255
    t.integer  "user_id",     limit: 4
    t.integer  "verify_code", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "phone_numbers", ["phone"], name: "index_phone_numbers_on_phone", using: :btree
  add_index "phone_numbers", ["user_id"], name: "index_phone_numbers_on_user_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "price",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "deleted_at", limit: 4
  end

  add_index "services", ["deleted_at"], name: "index_services_on_deleted_at", using: :btree

  create_table "stores", force: :cascade do |t|
    t.string   "name",       limit: 255, default: ""
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.datetime "deleted_at"
  end

  add_index "stores", ["deleted_at"], name: "index_stores_on_deleted_at", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255, default: "",    null: false
    t.string   "type",                   limit: 255
    t.string   "phone",                  limit: 255, default: "",    null: false
    t.string   "email",                  limit: 255, default: "",    null: false
    t.boolean  "is_member",              limit: 1,   default: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
    t.integer  "store_id",               limit: 4
    t.boolean  "gender",                 limit: 1,   default: false
    t.string   "weixin",                 limit: 255, default: ""
    t.datetime "deleted_at"
    t.integer  "raw_balance",            limit: 4,   default: 0
    t.float    "discount",               limit: 24,  default: 1.0
  end

  add_index "users", ["deleted_at"], name: "index_users_on_deleted_at", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["gender"], name: "index_users_on_gender", using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree
  add_index "users", ["phone"], name: "index_users_on_phone", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["store_id"], name: "index_users_on_store_id", using: :btree
  add_index "users", ["type"], name: "index_users_on_type", using: :btree

end
