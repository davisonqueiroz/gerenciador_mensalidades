class CreateOffers < ActiveRecord::Migration[8.0]
  def change
    create_table :offers do |t|
      t.string :course_name
      t.decimal :full_price
      t.decimal :discount_value
      t.float :discount_percentage
      t.boolean :limited
      t.integer :total_seats
      t.integer :paid_seats
      t.integer :reserved_seats
      t.string :status
      t.datetime :start_date
      t.datetime :end_date
      t.integer :max_payments

      t.timestamps
    end
  end
end
