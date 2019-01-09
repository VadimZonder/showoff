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

ActiveRecord::Schema.define(version: 2019_01_09_132120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "attachments", force: :cascade do |t|
    t.string "filename"
    t.string "content_type"
    t.binary "data"
  end

  create_table "bulletins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "is_f_tps", force: :cascade do |t|
    t.boolean "isFTP"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "account_number"
  end

  create_table "mappings", force: :cascade do |t|
    t.string "account_number"
    t.integer "a1"
    t.integer "b2"
    t.integer "c3"
    t.integer "d4"
    t.integer "e5"
    t.integer "f6"
    t.integer "g7"
    t.integer "h8"
    t.integer "i9"
    t.integer "j10"
    t.integer "k11"
    t.integer "l12"
    t.integer "m13"
    t.integer "n14"
    t.integer "o15"
    t.integer "p16"
    t.integer "q17"
    t.integer "r18"
    t.integer "s19"
    t.integer "t20"
    t.integer "u21"
    t.integer "v22"
    t.integer "w23"
    t.integer "x24"
    t.integer "y25"
    t.integer "z26"
    t.integer "aa27"
    t.integer "ab28"
    t.integer "ac29"
    t.integer "ad30"
    t.integer "ae31"
    t.integer "af32"
    t.integer "ag33"
    t.integer "ah34"
    t.integer "ai35"
    t.integer "aj36"
    t.integer "ak37"
    t.integer "al38"
    t.integer "am39"
    t.integer "an40"
    t.integer "ao41"
    t.integer "ap42"
    t.integer "aq43"
    t.integer "ar44"
    t.integer "as45"
    t.integer "at46"
    t.integer "au47"
    t.integer "av48"
    t.integer "aw49"
    t.integer "ax50"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resumes", force: :cascade do |t|
    t.string "name"
    t.string "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "widgets", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
