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

ActiveRecord::Schema[7.0].define(version: 2023_01_26_163759) do
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "candidates", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "phone"
    t.date "dob"
    t.string "location"
    t.string "nationality"
    t.boolean "terms_of_service", default: true
    t.text "bio"
    t.string "title"
    t.string "linkedin"
    t.boolean "completed", default: false
    t.date "availability", default: "2023-01-27"
    t.text "favorite_jobs", default: [], array: true
    t.text "company_alerts", default: [], array: true
    t.datetime "last_seen_at", default: "2023-01-27 21:46:45"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_candidates_on_company_id"
    t.index ["email"], name: "index_candidates_on_email", unique: true
    t.index ["reset_password_token"], name: "index_candidates_on_reset_password_token", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.boolean "subscribed", default: false
    t.string "plan", default: "Free"
    t.text "description"
    t.integer "employees_count"
    t.string "website"
    t.string "location"
    t.boolean "hidden", default: true
    t.string "currency"
    t.string "subdomain", null: false
    t.boolean "terms_of_service", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_applications", force: :cascade do |t|
    t.string "status", default: "Applied", null: false
    t.boolean "seen", default: false, null: false
    t.boolean "dealt_with", default: false, null: false
    t.bigint "job_id", null: false
    t.bigint "candidate_id", null: false
    t.bigint "company_id", null: false
    t.bigint "recruiter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_job_applications_on_candidate_id"
    t.index ["company_id"], name: "index_job_applications_on_company_id"
    t.index ["job_id"], name: "index_job_applications_on_job_id"
    t.index ["recruiter_id"], name: "index_job_applications_on_recruiter_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.string "salary"
    t.string "employment_type"
    t.string "location"
    t.text "role_description"
    t.text "requirements"
    t.text "benefits"
    t.text "interview_process"
    t.string "contact"
    t.date "expiry_date"
    t.string "status"
    t.boolean "searchable", default: false
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_jobs_on_company_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text "body"
    t.bigint "recruiter_id", null: false
    t.bigint "candidate_id", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_notes_on_candidate_id"
    t.index ["company_id"], name: "index_notes_on_company_id"
    t.index ["recruiter_id"], name: "index_notes_on_recruiter_id"
  end

  create_table "recruiters", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "role"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_recruiters_on_company_id"
    t.index ["email"], name: "index_recruiters_on_email", unique: true
    t.index ["reset_password_token"], name: "index_recruiters_on_reset_password_token", unique: true
  end

  create_table "tickets", force: :cascade do |t|
    t.text "body"
    t.bigint "recruiter_id", null: false
    t.string "status", default: "Open", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_tickets_on_company_id"
    t.index ["recruiter_id"], name: "index_tickets_on_recruiter_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "candidates", "companies"
  add_foreign_key "job_applications", "candidates"
  add_foreign_key "job_applications", "companies"
  add_foreign_key "job_applications", "jobs"
  add_foreign_key "job_applications", "recruiters"
  add_foreign_key "jobs", "companies"
  add_foreign_key "notes", "candidates"
  add_foreign_key "notes", "companies"
  add_foreign_key "notes", "recruiters"
  add_foreign_key "recruiters", "companies"
  add_foreign_key "tickets", "companies"
  add_foreign_key "tickets", "recruiters"
end
