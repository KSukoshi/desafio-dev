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

ActiveRecord::Schema[7.1].define(version: 2024_06_24_160544) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "payment_methods", force: :cascade do |t|
    t.string "payment_description"
    t.string "payment_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "payment_transaction_id"
    t.index ["payment_transaction_id"], name: "index_payment_methods_on_payment_transaction_id"
  end

  create_table "payment_transactions", force: :cascade do |t|
    t.date "transaction_date"
    t.decimal "value"
    t.string "cpf", limit: 11
    t.string "payment_card", limit: 12
    t.time "paid_at"
    t.string "store_owner"
    t.string "store_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "payment_method_id"
    t.index ["payment_method_id"], name: "index_payment_transactions_on_payment_method_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "payment_methods", "payment_transactions"
  add_foreign_key "payment_transactions", "payment_methods"
end
