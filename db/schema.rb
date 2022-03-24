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

ActiveRecord::Schema[7.0].define(version: 2022_03_24_221421) do
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
    t.string "name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.integer "order_id_id", null: false
    t.integer "deliverer_id_id", null: false
    t.datetime "scheduled_at", precision: nil
    t.datetime "arrival_at", precision: nil
    t.string "location"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deliverer_id_id"], name: "index_deliveries_on_deliverer_id_id"
    t.index ["order_id_id"], name: "index_deliveries_on_order_id_id"
  end

  create_table "lechons", force: :cascade do |t|
    t.string "size"
    t.integer "weight"
    t.integer "base_price"
    t.integer "sell_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id_id", null: false
    t.integer "lechon_id_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lechon_id_id"], name: "index_order_items_on_lechon_id_id"
    t.index ["order_id_id"], name: "index_order_items_on_order_id_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id_id", null: false
    t.integer "supplier_id_id", null: false
    t.integer "oven_id_id", null: false
    t.datetime "confirmed_at", precision: nil
    t.datetime "pickup_at", precision: nil
    t.datetime "cook_start", precision: nil
    t.datetime "cook_end", precision: nil
    t.datetime "completed_at", precision: nil
    t.boolean "completed"
    t.boolean "delivery"
    t.integer "delivery_charge"
    t.string "status"
    t.integer "total_price"
    t.string "payment_received"
    t.string "payment_type"
    t.string "payment_holder"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id_id"], name: "index_orders_on_customer_id_id"
    t.index ["oven_id_id"], name: "index_orders_on_oven_id_id"
    t.index ["supplier_id_id"], name: "index_orders_on_supplier_id_id"
  end

  create_table "ovens", force: :cascade do |t|
    t.string "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "company_name"
    t.string "address"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "deliveries", "deliverer_ids"
  add_foreign_key "deliveries", "order_ids"
  add_foreign_key "order_items", "lechon_ids"
  add_foreign_key "order_items", "order_ids"
  add_foreign_key "orders", "customer_ids"
  add_foreign_key "orders", "oven_ids"
  add_foreign_key "orders", "supplier_ids"
end
