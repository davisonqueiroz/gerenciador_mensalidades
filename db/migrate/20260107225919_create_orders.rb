class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :second_name
      t.string :student_cpf
      t.datetime :paid_at
      t.decimal :full_price
      t.decimal :price
      t.decimal :paid_value
      t.string :status

      t.timestamps
    end
  end
end
