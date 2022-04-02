# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_04_02_023535) do
  create_table "cart_items", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "quantity"
    t.integer "item_price_cents"
    t.integer "total_price_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lechon_option_id"
    t.index ["lechon_option_id"], name: "index_cart_items_on_lechon_option_id"
    t.index ["order_id"], name: "index_cart_items_on_order_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliverers", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "deliverer_id"
    t.integer "delivery_charge"
    t.datetime "scheduled_at", precision: nil
    t.datetime "arrival_at", precision: nil
    t.string "location"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deliverer_id"], name: "index_deliveries_on_deliverer_id"
    t.index ["order_id"], name: "index_deliveries_on_order_id"
  end

  create_table "lechon_options", force: :cascade do |t|
    t.string "size"
    t.integer "base_price"
    t.integer "sell_price"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lechons", force: :cascade do |t|
    t.integer "supplier_id"
    t.integer "oven_id"
    t.integer "order_id", null: false
    t.string "size"
    t.integer "base_price"
    t.integer "sell_price"
    t.integer "weight"
    t.boolean "ordered", default: false
    t.datetime "cook_start", precision: nil
    t.datetime "cook_end", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_lechons_on_order_id"
    t.index ["oven_id"], name: "index_lechons_on_oven_id"
    t.index ["supplier_id"], name: "index_lechons_on_supplier_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.datetime "confirmed_at", precision: nil
    t.datetime "pickup_at", precision: nil
    t.datetime "completed_at", precision: nil
    t.boolean "completed", default: false
    t.string "status", default: "Pending"
    t.string "payment_received", default: "Pending"
    t.string "payment_type"
    t.string "payment_holder"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "ovens", force: :cascade do |t|
    t.string "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "company_name", null: false
    t.string "address"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cart_items", "lechon_options"
  add_foreign_key "cart_items", "orders"
  add_foreign_key "deliveries", "deliverers"
  add_foreign_key "deliveries", "orders"
  add_foreign_key "lechons", "orders"
  add_foreign_key "lechons", "ovens"
  add_foreign_key "lechons", "suppliers"
  add_foreign_key "orders", "customers"
end
