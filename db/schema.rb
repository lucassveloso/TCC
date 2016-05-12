# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160511230113) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "addresses", force: :cascade do |t|
    t.string   "address"
    t.string   "zipcode"
    t.string   "complement"
    t.string   "state"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "number"
    t.string   "neighborhood"
  end

  create_table "certificates", force: :cascade do |t|
    t.string   "type_of"
    t.integer  "term_number"
    t.integer  "sheet_number"
    t.string   "book"
    t.date     "emission_date"
    t.string   "federation_unit"
    t.string   "notarys_office"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "identity_documents", force: :cascade do |t|
    t.integer  "identity_number"
    t.date     "dispatch_date"
    t.string   "federation_unit"
    t.string   "dispatcher_organ"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.string   "genre"
    t.date     "birthdate"
    t.string   "race"
    t.string   "phone"
    t.string   "cellphone"
    t.string   "naturalness"
    t.string   "nationality"
    t.integer  "address_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "responsibles", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "kinship"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responsibles_students", force: :cascade do |t|
    t.integer "responsible_id"
    t.integer "student_id"
  end

  add_index "responsibles_students", ["responsible_id"], name: "index_responsibles_students_on_responsible_id", using: :btree
  add_index "responsibles_students", ["student_id"], name: "index_responsibles_students_on_student_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "nis_number"
    t.integer  "certificate_id"
    t.integer  "identity_document_id"
    t.string   "cpf"
    t.date     "entry_date"
    t.string   "special_needs"
    t.string   "teaching_step"
    t.string   "photo_url"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

end
