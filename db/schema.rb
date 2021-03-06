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

ActiveRecord::Schema.define(version: 20170907134253) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assets", force: :cascade do |t|
    t.integer "assetable_id"
    t.string "assetable_type"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auth_tokens", force: :cascade do |t|
    t.integer "user_id"
    t.text "device"
    t.text "token"
    t.string "os"
    t.string "os_version"
    t.string "app_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_auth_tokens_on_user_id"
  end

  create_table "contributor_updates", force: :cascade do |t|
    t.integer "user_id"
    t.integer "contentable_id"
    t.string "contentable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kajians", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "mesjid_id"
    t.integer "ustad_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mesjids", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "kota"
    t.string "kecamatan"
    t.string "code"
    t.text "address"
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "tahun_berdiri"
    t.string "jenis"
    t.string "status_tanah"
    t.integer "province_id"
    t.time "open_time"
    t.time "close_time"
    t.text "notes"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer "reportable_id"
    t.string "reportable_type"
    t.integer "user_id"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_types", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "type"
    t.string "username"
    t.string "full_name"
    t.string "phone"
    t.string "ttl"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "ustads", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "notes"
    t.text "bidang"
    t.string "pekerjaan"
    t.integer "user_id"
    t.integer "mesjid_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
