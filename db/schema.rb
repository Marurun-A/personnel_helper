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

ActiveRecord::Schema.define(version: 2024_05_19_044037) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.string "telephone_number", null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_companies_on_email", unique: true
    t.index ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true
  end

  create_table "company_notifications", force: :cascade do |t|
    t.integer "company_id", null: false
    t.integer "staff_id"
    t.string "company_notifiable_type", null: false
    t.integer "company_notifiable_id", null: false
    t.boolean "read", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_company_notifications_on_company_id"
    t.index ["company_notifiable_type", "company_notifiable_id"], name: "index_company_notifications_on_company_notifiable"
  end

  create_table "employment_details", force: :cascade do |t|
    t.integer "employment_id", null: false
    t.integer "request_id", null: false
    t.integer "total_payment_amount", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employments", force: :cascade do |t|
    t.integer "company_id", null: false
    t.integer "staff_id", null: false
    t.date "response_deadline", null: false
    t.integer "total_payment_amount", null: false
    t.text "introduction", null: false
    t.integer "hourly_wage", null: false
    t.time "hours"
    t.date "date", null: false
    t.time "start_time", null: false
    t.time "finish_time", null: false
    t.text "place_of_employment", null: false
    t.string "contact_address"
    t.integer "payment_method"
    t.integer "employment_status"
    t.string "employment_name"
    t.string "employment_kana"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recruitment_forms", force: :cascade do |t|
    t.integer "recruitment_id", null: false
    t.integer "staff_id", null: false
    t.integer "company_id", null: false
    t.date "date"
    t.time "start_time"
    t.time "finish_time"
    t.time "response_deadline"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recruitment_tag_relations", force: :cascade do |t|
    t.integer "recruitment_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recruitment_id"], name: "index_recruitment_tag_relations_on_recruitment_id"
    t.index ["tag_id"], name: "index_recruitment_tag_relations_on_tag_id"
  end

  create_table "recruitments", force: :cascade do |t|
    t.string "recruitment_name", null: false
    t.string "recruitment_kana", null: false
    t.text "introduction", null: false
    t.integer "hourly_wage", null: false
    t.date "start_date", null: false
    t.date "finish_date", null: false
    t.time "start_time", null: false
    t.time "finish_time", null: false
    t.time "minimum_time", null: false
    t.text "place", null: false
    t.string "contact_address", null: false
    t.integer "company_id", null: false
    t.integer "tag_ids"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "request_forms", force: :cascade do |t|
    t.integer "request_id", null: false
    t.integer "company_id", null: false
    t.integer "staff_id", null: false
    t.date "date"
    t.time "start_time"
    t.time "finish_time"
    t.time "response_deadline"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "request_tag_relations", force: :cascade do |t|
    t.integer "request_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["request_id"], name: "index_request_tag_relations_on_request_id"
    t.index ["tag_id"], name: "index_request_tag_relations_on_tag_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "request_name", null: false
    t.string "request_kana", null: false
    t.text "introduction", null: false
    t.date "start_date", null: false
    t.date "finish_date", null: false
    t.time "start_time", null: false
    t.time "finish_time", null: false
    t.time "maximum_time", null: false
    t.text "place", null: false
    t.string "contact_address", null: false
    t.integer "staff_id", null: false
    t.integer "tag_ids"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "staff_notifications", force: :cascade do |t|
    t.integer "staff_id", null: false
    t.integer "company_id"
    t.string "staff_notifiable_type", null: false
    t.integer "staff_notifiable_id", null: false
    t.boolean "read", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["staff_id"], name: "index_staff_notifications_on_staff_id"
    t.index ["staff_notifiable_type", "staff_notifiable_id"], name: "index_staff_notifications_on_staff_notifiable"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.string "telephone_number", null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_staffs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "work_details", force: :cascade do |t|
    t.integer "work_id", null: false
    t.integer "recruitment_id", null: false
    t.integer "total_payment_amount", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "works", force: :cascade do |t|
    t.integer "staff_id", null: false
    t.integer "company_id", null: false
    t.date "response_deadline", null: false
    t.integer "total_payment_amount", null: false
    t.text "introduction", null: false
    t.text "transportation", null: false
    t.time "hours", null: false
    t.date "date", null: false
    t.time "start_time", null: false
    t.time "finish_time", null: false
    t.text "whereabouts", null: false
    t.string "contact_address", null: false
    t.integer "payment_method", null: false
    t.integer "work_status", null: false
    t.string "work_name"
    t.string "work_kana"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "company_notifications", "companies"
  add_foreign_key "recruitment_tag_relations", "recruitments"
  add_foreign_key "recruitment_tag_relations", "tags"
  add_foreign_key "request_tag_relations", "requests"
  add_foreign_key "request_tag_relations", "tags"
  add_foreign_key "staff_notifications", "staffs"
end
