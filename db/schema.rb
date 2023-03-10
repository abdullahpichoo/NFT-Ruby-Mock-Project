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

ActiveRecord::Schema[7.0].define(version: 2023_01_02_191720) do
  create_table "carts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "nfts", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.string "created_by"
    t.string "owner"
    t.string "images"
    t.integer "wallet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wallet_id"], name: "index_nfts_on_wallet_id"
  end

  create_table "orderables", force: :cascade do |t|
    t.integer "cart_id", null: false
    t.integer "nft_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_orderables_on_cart_id"
    t.index ["nft_id"], name: "index_orderables_on_nft_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "NFT_name", null: false
    t.integer "NFT_id", null: false
    t.integer "Buyer_id", null: false
    t.integer "Seller_id", null: false
    t.string "Buyer", null: false
    t.string "Seller", null: false
    t.decimal "Buy_price", default: "0.0"
    t.decimal "Change_in_price", default: "0.0"
    t.datetime "transaction_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wallets", force: :cascade do |t|
    t.decimal "balance", default: "0.0"
    t.integer "items_sold", default: 0
    t.decimal "earnings", default: "0.0"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  add_foreign_key "carts", "users"
  add_foreign_key "nfts", "wallets"
  add_foreign_key "orderables", "carts"
  add_foreign_key "orderables", "nfts"
  add_foreign_key "wallets", "users"
end
