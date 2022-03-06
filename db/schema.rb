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

ActiveRecord::Schema[7.0].define(version: 2022_03_06_114718) do
  create_table "bookings", force: :cascade do |t|
    t.integer "company_id", null: false
    t.integer "customer_id", null: false
    t.datetime "booked_at", precision: nil
    t.string "services"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_bookings_on_company_id"
    t.index ["customer_id"], name: "index_bookings_on_customer_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.string "gst_in", null: false
    t.string "pan", null: false
    t.string "address"
    t.integer "chairs"
    t.json "working_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.integer "company_id", null: false
    t.string "name"
    t.string "duration"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_services_on_company_id"
  end

  add_foreign_key "bookings", "companies"
  add_foreign_key "bookings", "customers"
  add_foreign_key "services", "companies"
end
