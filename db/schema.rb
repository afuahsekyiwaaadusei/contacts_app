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

ActiveRecord::Schema[8.0].define(version: 2025_02_20_112714) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "assigned_fee", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.string "entity_code", limit: 10
    t.decimal "amount", precision: 10, scale: 2, default: "0.0"
    t.string "fee_type", limit: 5
    t.decimal "threshold", precision: 10, scale: 2, default: "0.0"
    t.decimal "cap", precision: 10, scale: 2, default: "0.0"
    t.string "target", limit: 5
    t.string "payment_mode", limit: 5
    t.string "currency", limit: 5
    t.datetime "fee_start_at", precision: nil
    t.datetime "fee_end_at", precision: nil
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.integer "user_id"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil
  end

  create_table "cust_pre_mfa_info", id: :serial, force: :cascade do |t|
    t.string "profile_id", limit: 10
    t.string "customer_number", limit: 20
    t.text "payload"
    t.boolean "status"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil
    t.string "entity_code", limit: 10
    t.index ["created_at"], name: "cust_pre_mfa_info_created_at_idx"
    t.index ["customer_number"], name: "cust_pre_mfa_info_customer_number_idx"
    t.index ["profile_id"], name: "cust_pre_mfa_info_profile_id_idx"
    t.index ["updated_at"], name: "cust_pre_mfa_info_updated_at_idx"
  end

  create_table "customer_ticket", id: :serial, force: :cascade do |t|
    t.string "assigned_code", limit: 10
    t.integer "payment_info_id"
    t.string "qr_data", limit: 255
    t.string "qr_path", limit: 255
    t.string "alt_code", limit: 255
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil
    t.index ["assigned_code"], name: "customer_ticket_assigned_code_idx"
    t.index ["created_at"], name: "customer_ticket_created_at_idx"
    t.index ["payment_info_id"], name: "customer_ticket_payment_info_id_idx"
    t.index ["updated_at"], name: "customer_ticket_updated_at_idx"
  end

  create_table "customer_ticket_share", force: :cascade do |t|
    t.string "recipient_email", limit: 155, null: false
    t.string "recipient_mobile_no", limit: 20, null: false
    t.string "customer_ticket_code", limit: 10, null: false
    t.text "narration", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_ticket_code"], name: "index_customer_ticket_share_on_customer_ticket_code"
    t.index ["recipient_email"], name: "index_customer_ticket_share_on_recipient_email"
    t.index ["recipient_mobile_no"], name: "index_customer_ticket_share_on_recipient_mobile_no"
  end

  create_table "customer_ticket_status", force: :cascade do |t|
    t.string "customer_ticket_code", limit: 10, null: false
    t.integer "scans_bef", default: 0, null: false
    t.integer "scans_aft", default: 0, null: false
    t.integer "usage_rem", default: 0, null: false
    t.datetime "scanned_at", null: false
    t.integer "scanned_by", null: false
    t.integer "entity_venue_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_ticket_code"], name: "index_customer_ticket_status_on_customer_ticket_code", unique: true
    t.index ["entity_venue_id"], name: "index_customer_ticket_status_on_entity_venue_id"
    t.index ["scanned_at"], name: "index_customer_ticket_status_on_scanned_at"
    t.index ["scanned_by"], name: "index_customer_ticket_status_on_scanned_by"
  end

  create_table "entity_api_access", id: :serial, force: :cascade do |t|
    t.string "entity_code", limit: 10
    t.string "client_key", limit: 255
    t.string "secret_key", limit: 255
    t.integer "service_id"
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.integer "user_id"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil
    t.index ["created_at"], name: "entity_api_access_created_at_idx"
    t.index ["entity_code"], name: "entity_api_access_entity_code_idx"
    t.index ["updated_at"], name: "entity_api_access_updated_at_idx"
    t.index ["user_id"], name: "entity_api_access_user_id_idx"
  end

  create_table "entity_balance", id: :serial, force: :cascade do |t|
    t.string "entity_code", limit: 10
    t.decimal "balance", precision: 12, scale: 2, default: "0.0"
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil
    t.index ["created_at"], name: "entity_balance_created_at_idx"
    t.index ["entity_code"], name: "entity_balance_entity_code_idx"
    t.index ["updated_at"], name: "entity_balance_updated_at_idx"
  end

  create_table "entity_contact_info", id: :serial, force: :cascade do |t|
    t.string "entity_code", limit: 10
    t.string "contact_number", limit: 20
    t.string "contact_address", limit: 20
    t.string "email_address", limit: 155
    t.string "postal_address", limit: 155
    t.string "location_address", limit: 155
    t.string "nearest_landmark", limit: 155
    t.string "map_address", limit: 155
    t.string "logo_path", limit: 155
    t.string "logo_data", limit: 155
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.integer "user_id"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil
    t.string "sms_alias", limit: 15
    t.index ["created_at"], name: "entity_contact_info_created_at_idx"
    t.index ["created_at"], name: "show_sub_cat_created_at_idx"
    t.index ["entity_code"], name: "entity_contact_info_entity_code_idx"
    t.index ["updated_at"], name: "entity_contact_info_updated_at_idx"
    t.index ["updated_at"], name: "show_sub_cat_updated_at_idx"
    t.index ["user_id"], name: "entity_contact_info_user_id_idx"
    t.index ["user_id"], name: "show_sub_cat_user_id_idx"
  end

  create_table "entity_info", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.string "assigned_code", limit: 10
    t.string "entity_name", limit: 255
    t.string "entity_alias", limit: 50
    t.string "narration", limit: 255
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.integer "user_id"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil
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

  create_table "entity_service_bal_movement", id: :serial, force: :cascade do |t|
    t.string "processing_id", limit: 20
    t.decimal "bal_before", precision: 12, scale: 2, default: "0.0"
    t.decimal "bal_after", precision: 12, scale: 2, default: "0.0"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.index ["created_at"], name: "entity_service_bal_movement_created_at_idx"
    t.index ["processing_id"], name: "entity_service_bal_movement_processing_id_idx"
  end

  create_table "entity_show_cat", force: :cascade do |t|
    t.integer "entity_info_id", null: false
    t.string "show_cat_code", limit: 5, null: false
    t.string "narration", limit: 255
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active_status", "del_status"], name: "index_entity_show_cat_on_active_status_and_del_status"
    t.index ["entity_info_id"], name: "index_entity_show_cat_on_entity_info_id"
    t.index ["show_cat_code"], name: "index_entity_show_cat_on_show_cat_code", unique: true
  end

  create_table "entity_show_info", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.string "entity_code", limit: 10
    t.integer "show_sub_cat_id"
    t.string "show_title", limit: 155
    t.string "show_alias", limit: 50
    t.string "narration", limit: 255
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.integer "user_id"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil
  end

  create_table "entity_show_motion_media", force: :cascade do |t|
    t.integer "entity_show_info_id", null: false
    t.string "video_path", limit: 255, null: false
    t.string "video_data", limit: 255, null: false
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active_status", "del_status"], name: "index_entity_show_motion_media_on_active_status_and_del_status"
    t.index ["entity_show_info_id"], name: "index_entity_show_motion_media_on_entity_show_info_id"
  end

  create_table "entity_show_schedule", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.integer "entity_show_info_id"
    t.date "show_date"
    t.string "narration", limit: 255
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.integer "user_id"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil
  end

  create_table "entity_show_static_media", force: :cascade do |t|
    t.integer "entity_show_info_id", null: false
    t.string "image_path_l", limit: 255, null: false
    t.string "image_data_l", limit: 255, null: false
    t.string "image_path_p", limit: 255, null: false
    t.string "image_data_p", limit: 255, null: false
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active_status", "del_status"], name: "index_entity_show_static_media_on_active_status_and_del_status"
    t.index ["entity_show_info_id"], name: "index_entity_show_static_media_on_entity_show_info_id"
  end

  create_table "entity_show_sub_schedule", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.integer "show_schedule_id"
    t.time "show_time"
    t.integer "venue_info_id"
    t.string "narration", limit: 255
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.integer "user_id"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil
  end

  create_table "entity_show_ticket", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.integer "show_sub_schedule_id"
    t.integer "ticket_info_id"
    t.decimal "price", precision: 10, scale: 2
    t.string "currency", limit: 5
    t.decimal "base_convert_rate", precision: 10, scale: 2
    t.datetime "validity_start", precision: nil
    t.datetime "validity_end", precision: nil
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.integer "user_id"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil
  end

  create_table "entity_ticket_info", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.string "entity_code", limit: 10
    t.integer "ticket_type_id"
    t.string "ticket_name", limit: 155
    t.string "ticket_alias", limit: 50
    t.integer "reuse_count", default: 1
    t.integer "entitlement", default: 1
    t.string "narration", limit: 255
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.integer "user_id"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil
  end

  create_table "mfa_auth", id: :serial, force: :cascade do |t|
    t.string "account", limit: 255
    t.string "auth_code", limit: 255
    t.boolean "expired"
    t.boolean "status"
    t.string "ref_code", limit: 10
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", precision: nil
    t.string "account_type", limit: 5
    t.string "activity_type", limit: 5
    t.integer "cust_opera_payload_id"
    t.index ["account"], name: "mfa_auth_account_idx"
    t.index ["auth_code"], name: "mfa_auth_auth_code_idx"
    t.index ["created_at"], name: "mfa_auth_created_at_idx"
    t.index ["updated_at"], name: "mfa_auth_updated_at_idx"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "recipient_type", null: false
    t.bigint "recipient_id", null: false
    t.string "actor_type"
    t.bigint "actor_id"
    t.string "action", null: false
    t.string "notifiable_type", null: false
    t.bigint "notifiable_id", null: false
    t.boolean "read", default: false
    t.datetime "read_at"
    t.text "body"
    t.string "url"
    t.boolean "action_taken", default: false
    t.datetime "action_taken_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_type", "actor_id"], name: "index_notifications_on_actor"
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable"
    t.index ["recipient_type", "recipient_id"], name: "index_notifications_on_recipient"
  end

  create_table "payment_callback", id: :serial, force: :cascade do |t|
    t.string "trans_status", limit: 100
    t.string "trans_id", limit: 100
    t.string "trans_ref", limit: 20
    t.string "trans_msg", limit: 255
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.text "extra"
    t.index ["created_at"], name: "payment_callback_created_at_idx"
    t.index ["trans_id"], name: "payment_callback_trans_id_idx"
    t.index ["trans_ref"], name: "payment_callback_trans_ref_idx"
    t.index ["trans_status"], name: "payment_callback_trans_status_idx"
  end

  create_table "payment_info", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.string "pan", limit: 20
    t.string "nw", limit: 5
    t.string "payment_mode", limit: 5
    t.string "email", limit: 155
    t.string "mobile_number", limit: 20
    t.boolean "status"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil
    t.decimal "total_amount", precision: 10, scale: 2, default: "0.0"
    t.decimal "total_charge", precision: 10, scale: 2
    t.string "narration", limit: 255
  end

  create_table "payment_request", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.string "pan", limit: 20
    t.string "nw", limit: 5
    t.decimal "amount", precision: 10, scale: 2, default: "0.0"
    t.string "processing_id", limit: 20
    t.integer "payment_info_id"
    t.boolean "processed"
    t.string "narration", limit: 155
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil
    t.string "trans_type", limit: 5
  end

  create_table "payment_sub_info", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.integer "payment_info_id"
    t.integer "entity_show_ticket_id"
    t.decimal "amount", precision: 10, scale: 2, default: "0.0"
    t.integer "tickets"
    t.decimal "charge", precision: 10, scale: 2, default: "0.0"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "permissions", force: :cascade do |t|
    t.string "subject_class"
    t.string "action"
    t.string "name"
    t.string "comment"
    t.boolean "active_status"
    t.boolean "del_status"
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
    t.boolean "active_status"
    t.boolean "del_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "show_cat", id: :serial, force: :cascade do |t|
    t.string "assigned_code", limit: 5
    t.string "show_cat_name", limit: 155
    t.string "narration", limit: 255
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.integer "user_id"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil
    t.index ["assigned_code"], name: "show_cat_assigned_code_idx"
    t.index ["created_at"], name: "show_cat_created_at_idx"
    t.index ["updated_at"], name: "show_cat_updated_at_idx"
    t.index ["user_id"], name: "show_cat_user_id_idx"
  end

  create_table "show_sub_cat", id: :serial, force: :cascade do |t|
    t.string "show_cat_code", limit: 5
    t.string "sub_cat_name", limit: 155
    t.string "narration", limit: 255
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.integer "user_id"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil
    t.index ["show_cat_code"], name: "show_sub_cat_show_cat_code_idx"
  end

  create_table "ticket_type", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.string "type_desc", limit: 155
    t.boolean "charged", default: true
    t.boolean "hidden", default: false
    t.string "narration", limit: 255
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.integer "user_id"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil
  end

  create_table "user_roles", force: :cascade do |t|
    t.string "role_code"
    t.string "user_code"
    t.string "entity_code"
    t.string "creator_id"
    t.boolean "active_status"
    t.boolean "del_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_code", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "username", null: false
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
    t.string "mobile_number"
    t.index ["email"], name: "index_users_on_email", unique: true, where: "(active_status = true)"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, where: "(active_status = true)"
    t.index ["user_code"], name: "index_users_on_user_code", unique: true, where: "(active_status = true)"
    t.index ["username"], name: "index_users_on_username", unique: true, where: "(active_status = true)"
  end

  create_table "venue_extra_info", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.integer "venue_info_id"
    t.integer "region_info_id"
    t.string "mobile_number", limit: 20
    t.string "postal_address", limit: 255
    t.string "email_address", limit: 155
    t.string "location_address", limit: 255
    t.string "nearest_landmark", limit: 155
    t.string "map_address", limit: 155
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.integer "user_id"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil
  end

  create_table "venue_info", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.string "venue_name", limit: 255
    t.string "venue_alias", limit: 50
    t.integer "seating"
    t.string "narration", limit: 255
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.integer "user_id"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil
  end

  create_table "venue_static_media", force: :cascade do |t|
    t.integer "venue_info_id", null: false
    t.string "image_path_l", limit: 255, null: false
    t.string "image_data_l", limit: 255, null: false
    t.string "image_path_p", limit: 255, null: false
    t.string "image_data_p", limit: 255, null: false
    t.boolean "active_status", default: true
    t.boolean "del_status", default: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active_status", "del_status"], name: "index_venue_static_media_on_active_status_and_del_status"
    t.index ["venue_info_id"], name: "index_venue_static_media_on_venue_info_id"
  end
end
