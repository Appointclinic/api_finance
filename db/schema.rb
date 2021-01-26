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

ActiveRecord::Schema.define(version: 2021_01_26_054301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.string "country", default: "BR"
    t.string "number"
    t.string "complement"
    t.string "postal_code"
    t.bigint "company_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id", "version"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.string "name"
    t.decimal "initial_value"
    t.bigint "company_unity_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_unity_id"], name: "index_bank_accounts_on_company_unity_id"
  end

  create_table "cash_accounts", force: :cascade do |t|
    t.bigint "company_unity_id", null: false
    t.date "enclosing"
    t.string "responsible"
    t.decimal "total_registered"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_unity_id"], name: "index_cash_accounts_on_company_unity_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "tax_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "company_unities", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_company_unities_on_company_id"
  end

  create_table "incomings", force: :cascade do |t|
    t.bigint "cash_account_id", null: false
    t.bigint "parent_id"
    t.string "client_name"
    t.string "client_identification"
    t.decimal "value"
    t.text "observations"
    t.string "description"
    t.bigint "bank_account_id"
    t.integer "kind"
    t.boolean "split", default: false
    t.boolean "repeat", default: false
    t.integer "repeat_period"
    t.integer "repeat_occurrency"
    t.decimal "upfront_payment"
    t.integer "split_quantity"
    t.date "due_date"
    t.boolean "paid", default: false
    t.date "paid_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cash_account_id"], name: "index_incomings_on_cash_account_id"
  end

  create_table "outgoings", force: :cascade do |t|
    t.string "client_name"
    t.bigint "cash_account_id", null: false
    t.bigint "parent_id"
    t.string "client_identification"
    t.decimal "value"
    t.boolean "expense", default: false
    t.text "observations"
    t.string "description"
    t.bigint "bank_account_id"
    t.integer "kind"
    t.boolean "split", default: false
    t.boolean "repeat", default: false
    t.integer "repeat_period"
    t.integer "repeat_occurrency"
    t.decimal "upfront_payment"
    t.integer "split_quantity"
    t.date "due_date"
    t.boolean "paid", default: false
    t.date "paid_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cash_account_id"], name: "index_outgoings_on_cash_account_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "social_security_number"
    t.bigint "company_unity_id"
    t.integer "role"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.boolean "allow_password_change", default: false
    t.json "tokens"
    t.index ["company_unity_id"], name: "index_users_on_company_unity_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "bank_accounts", "company_unities"
  add_foreign_key "cash_accounts", "company_unities"
  add_foreign_key "company_unities", "companies"
  add_foreign_key "incomings", "cash_accounts"
  add_foreign_key "outgoings", "cash_accounts"
  add_foreign_key "users", "company_unities"
end
