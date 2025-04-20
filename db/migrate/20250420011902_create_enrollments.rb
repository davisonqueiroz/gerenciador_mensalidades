class CreateEnrollments < ActiveRecord::Migration[8.0]
  def change
    create_table :enrollments do |t|
      t.decimal :total_value
      t.integer :invoice_quantity
      t.integer :due_day
      t.string :course_name
      t.references :university, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
