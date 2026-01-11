class CreateSubscriptions < ActiveRecord::Migration[8.0]
  def change
    create_table :subscriptions do |t|
      t.string :cpf
      t.string :status
      t.string :payment_method
      t.decimal :price
      t.integer :paid_cycles

      t.timestamps
    end
  end
end
