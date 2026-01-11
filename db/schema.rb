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

ActiveRecord::Schema[8.0].define(version: 2026_01_11_004930) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "address"
    t.string "adress_adjunct"
    t.integer "address_number"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "neighborhood"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.string "course_name"
    t.decimal "full_price"
    t.decimal "paid_value"
    t.jsonb "student_data"
    t.string "status"
    t.text "description"
    t.text "warnings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cycles", force: :cascade do |t|
    t.integer "index"
    t.integer "status", default: 0
    t.decimal "value"
    t.datetime "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "institutions", force: :cascade do |t|
    t.string "name"
    t.string "cnpj"
    t.integer "institution_type", default: 0
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "offers", force: :cascade do |t|
    t.string "course_name"
    t.decimal "full_price"
    t.decimal "discount_value"
    t.float "discount_percentage"
    t.boolean "limited"
    t.integer "total_seats"
    t.integer "paid_seats"
    t.integer "reserved_seats"
    t.integer "status", default: 0
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "max_payments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "first_name"
    t.string "second_name"
    t.string "student_cpf"
    t.datetime "paid_at"
    t.decimal "full_price"
    t.decimal "price"
    t.decimal "paid_value"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "value"
    t.integer "status", default: 0
    t.integer "payment_method", default: 0
    t.jsonb "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "subscriptions", force: :cascade do |t|
    t.string "cpf"
    t.integer "status", default: 0
    t.integer "payment_method", default: 0
    t.decimal "price"
    t.integer "paid_cycles"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "cycle_index"
    t.integer "status", default: 0
    t.integer "payment_method", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
