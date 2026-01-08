class CreateTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions do |t|
      t.integer :cycle_index
      t.string :status
      t.string :payment_method

      t.timestamps
    end
  end
end
