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

ActiveRecord::Schema[8.0].define(version: 2025_02_20_153253) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name"
    t.string "phone_number", null: false
    t.string "email"
    t.string "image_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_name"], name: "index_contacts_on_first_name"
    t.index ["last_name"], name: "index_contacts_on_last_name"
    t.index ["phone_number"], name: "index_contacts_on_phone_number"
  end

  create_table "entity_infos", force: :cascade do |t|
    t.string "assigned_code", null: false
    t.string "entity_name", null: false
    t.string "entity_alias", limit: 50, null: false
    t.string "narration", limit: 255
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active_status", "del_status"], name: "index_entity_infos_on_active_status_and_del_status"
    t.index ["assigned_code"], name: "index_entity_infos_on_assigned_code", unique: true
    t.index ["entity_alias"], name: "index_entity_infos_on_entity_alias", unique: true, where: "(entity_alias IS NOT NULL)"
    t.index ["entity_name"], name: "index_entity_infos_on_entity_name", unique: true
  end

  create_table "permissions", force: :cascade do |t|
    t.string "subject_class"
    t.string "action"
    t.string "name"
    t.string "comment"
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permissions_roles", force: :cascade do |t|
    t.integer "permission_id"
    t.string "role_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "role_code"
    t.string "role_type"
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.string "role_code", null: false
    t.string "user_code"
    t.string "entity_code"
    t.string "creator_id"
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_code", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "username", null: false
    t.string "mobile_number", null: false
    t.string "image_path"
    t.boolean "first_login", default: true, null: false
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.string "creator_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true, where: "(active_status = true)"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, where: "(active_status = true)"
    t.index ["user_code"], name: "index_users_on_user_code", unique: true, where: "(active_status = true)"
    t.index ["username"], name: "index_users_on_username", unique: true, where: "(active_status = true)"
  end
end
