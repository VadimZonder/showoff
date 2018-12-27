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

ActiveRecord::Schema.define(version: 2018_12_21_090356) do

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

  create_table "bulletins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "is_f_tps", force: :cascade do |t|
    t.boolean "isFTP"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "is_ftps", force: :cascade do |t|
    t.boolean "isFTP"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mappings", force: :cascade do |t|
    t.string "a1"
    t.string "b2"
    t.string "c3"
    t.string "d4"
    t.string "e5"
    t.string "f6"
    t.string "g7"
    t.string "h8"
    t.string "i9"
    t.string "j10"
    t.string "k11"
    t.string "l12"
    t.string "m13"
    t.string "n14"
    t.string "x24"
    t.string "y25"
    t.string "z26"
    t.string "aa27"
    t.string "ad30"
    t.string "ae31"
    t.string "af32"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "widgets", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
