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

ActiveRecord::Schema[8.0].define(version: 2026_01_06_003519) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "enrollments", force: :cascade do |t|
    t.decimal "total_value", null: false
    t.integer "invoice_quantity", null: false
    t.integer "due_day", null: false
    t.string "course_name", null: false
    t.integer "university_id", null: false
    t.integer "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_enrollments_on_student_id"
    t.index ["university_id"], name: "index_enrollments_on_university_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.decimal "invoice_value", null: false
    t.date "due_date", null: false
    t.integer "enrollment_id", null: false
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enrollment_id"], name: "index_invoices_on_enrollment_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name", null: false
    t.string "cpf", null: false
    t.date "date_of_birth"
    t.integer "cellphone"
    t.string "gender", null: false
    t.string "payment_method", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "index_students_on_cpf", unique: true
  end

  create_table "universities", force: :cascade do |t|
    t.string "name", null: false
    t.string "cnpj"
    t.string "university_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "cnpj"], name: "index_universities_on_name_and_cnpj", unique: true
  end

  add_foreign_key "enrollments", "students"
  add_foreign_key "enrollments", "universities"
  add_foreign_key "invoices", "enrollments"
end
