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

ActiveRecord::Schema.define(version: 20160618053720) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "additional_activities", force: :cascade do |t|
    t.string   "activity"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.boolean  "participating"
  end

  create_table "additional_activities_students", force: :cascade do |t|
    t.integer "additional_activity_id"
    t.integer "student_id"
  end

  add_index "additional_activities_students", ["additional_activity_id"], name: "index_additional_activities_students_on_additional_activity_id", using: :btree
  add_index "additional_activities_students", ["student_id"], name: "index_additional_activities_students_on_student_id", using: :btree

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

  create_table "authorizations", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "authorized"
  end

  create_table "authorizations_students", force: :cascade do |t|
    t.integer "authorization_id"
    t.integer "student_id"
  end

  add_index "authorizations_students", ["authorization_id"], name: "index_authorizations_students_on_authorization_id", using: :btree
  add_index "authorizations_students", ["student_id"], name: "index_authorizations_students_on_student_id", using: :btree

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

  create_table "documents", force: :cascade do |t|
    t.string   "cpf"
    t.integer  "identity_document_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "certificate_id"
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
    t.string   "ethnicity"
    t.string   "phone"
    t.string   "cellphone"
    t.string   "naturalness"
    t.string   "nationality"
    t.integer  "address_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "email"
    t.string   "religion"
    t.string   "photo_url"
    t.integer  "document_id"
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

  create_table "school_classes", force: :cascade do |t|
    t.integer  "number"
    t.string   "classroom"
    t.string   "grade"
    t.string   "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "school_classes_teachers", force: :cascade do |t|
    t.integer "school_class_id"
    t.integer "teacher_id"
  end

  add_index "school_classes_teachers", ["school_class_id"], name: "index_school_classes_teachers_on_school_class_id", using: :btree
  add_index "school_classes_teachers", ["teacher_id"], name: "index_school_classes_teachers_on_teacher_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "nis_number"
    t.date     "entry_date"
    t.string   "special_needs"
    t.string   "teaching_step"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "notes"
    t.integer  "school_class_id"
    t.boolean  "bolsa_familia"
  end

  create_table "teachers", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "registration_number"
    t.string   "notes"
    t.string   "time_load"
    t.string   "subject"
    t.date     "admission_date"
    t.string   "qualifications"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

end
