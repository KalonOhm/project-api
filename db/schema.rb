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

ActiveRecord::Schema[7.0].define(version: 2023_03_23_053341) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "collection_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "collection_id", null: false
    t.string "group_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_groups_on_collection_id"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "minis", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "collection_id", null: false
    t.bigint "group_id", null: false
    t.bigint "subgroup_id", null: false
    t.string "mini_name"
    t.string "loadout"
    t.integer "quantity"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_minis_on_collection_id"
    t.index ["group_id"], name: "index_minis_on_group_id"
    t.index ["subgroup_id"], name: "index_minis_on_subgroup_id"
    t.index ["user_id"], name: "index_minis_on_user_id"
  end

  create_table "paint_brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paint_scheme_paints", force: :cascade do |t|
    t.bigint "paint_scheme_id", null: false
    t.bigint "paint_id", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paint_id"], name: "index_paint_scheme_paints_on_paint_id"
    t.index ["paint_scheme_id"], name: "index_paint_scheme_paints_on_paint_scheme_id"
  end

  create_table "paint_schemes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_paint_schemes_on_user_id"
  end

  create_table "paints", force: :cascade do |t|
    t.bigint "paint_brand_id", null: false
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paint_brand_id"], name: "index_paints_on_paint_brand_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subgroups", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "collection_id", null: false
    t.bigint "group_id", null: false
    t.string "subgroup_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_subgroups_on_collection_id"
    t.index ["group_id"], name: "index_subgroups_on_group_id"
    t.index ["user_id"], name: "index_subgroups_on_user_id"
  end

  create_table "tokens", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "value"
    t.datetime "expiry", precision: nil
    t.string "ip"
    t.datetime "revocation_date", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tokens_on_user_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone", null: false
    t.string "password_digest", null: false
    t.boolean "invitation_accepted", default: false
    t.string "invitation_token"
    t.datetime "invitation_expiration", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "collections", "users"
  add_foreign_key "groups", "collections"
  add_foreign_key "groups", "users"
  add_foreign_key "minis", "collections"
  add_foreign_key "minis", "groups"
  add_foreign_key "minis", "subgroups"
  add_foreign_key "minis", "users"
  add_foreign_key "paint_scheme_paints", "paint_schemes"
  add_foreign_key "paint_scheme_paints", "paints"
  add_foreign_key "paint_schemes", "users"
  add_foreign_key "paints", "paint_brands"
  add_foreign_key "subgroups", "collections"
  add_foreign_key "subgroups", "groups"
  add_foreign_key "subgroups", "users"
  add_foreign_key "tokens", "users"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
