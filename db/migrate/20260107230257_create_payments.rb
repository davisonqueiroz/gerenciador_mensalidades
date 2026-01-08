class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.decimal :value
      t.string :status
      t.string :payment_method
      t.jsonb :metadata

      t.timestamps
    end
  end
end
