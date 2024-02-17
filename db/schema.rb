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

ActiveRecord::Schema[7.1].define(version: 2024_02_17_000646) do
  create_table "seed_growing_instances", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "variety_id", null: false
    t.datetime "start_date"
    t.datetime "harvest_date"
    t.text "story"
    t.boolean "seeds_saved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_seed_growing_instances_on_user_id"
    t.index ["variety_id"], name: "index_seed_growing_instances_on_variety_id"
  end

  create_table "source_records", force: :cascade do |t|
    t.integer "source_id", null: false
    t.integer "variety_id", null: false
    t.text "story"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_source_records_on_source_id"
    t.index ["variety_id"], name: "index_source_records_on_variety_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "name"
    t.text "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "varieties", force: :cascade do |t|
    t.integer "type_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_id"], name: "index_varieties_on_type_id"
  end

  add_foreign_key "seed_growing_instances", "users"
  add_foreign_key "seed_growing_instances", "varieties"
  add_foreign_key "source_records", "sources"
  add_foreign_key "source_records", "varieties"
  add_foreign_key "varieties", "types"
end
