class CreateCoupons < ActiveRecord::Migration[8.0]
  def change
    create_table :coupons do |t|
      t.string :course_name
      t.decimal :full_price
      t.decimal :paid_value
      t.jsonb :student_data
      t.string :status
      t.text :description
      t.text :warnings

      t.timestamps
    end
  end
end
