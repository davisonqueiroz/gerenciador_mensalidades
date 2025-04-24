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

ActiveRecord::Schema[8.0].define(version: 2025_04_21_020133) do
  create_table "enrollments", force: :cascade do |t|
    t.decimal "total_value"
    t.integer "invoice_quantity"
    t.integer "due_day"
    t.string "course_name"
    t.integer "university_id", null: false
    t.integer "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_enrollments_on_student_id"
    t.index ["university_id"], name: "index_enrollments_on_university_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.decimal "invoice_value"
    t.date "due_date"
    t.integer "enrollment_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enrollment_id"], name: "index_invoices_on_enrollment_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.date "date_of_birth"
    t.integer "cellphone"
    t.string "gender"
    t.string "payment_method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "universities", force: :cascade do |t|
    t.string "name"
    t.string "cnpj"
    t.string "university_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "enrollments", "students"
  add_foreign_key "enrollments", "universities"
  add_foreign_key "invoices", "enrollments"
end
