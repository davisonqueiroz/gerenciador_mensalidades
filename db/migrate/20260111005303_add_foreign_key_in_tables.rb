class AddForeignKeyInTables < ActiveRecord::Migration[8.0]
  def change
    add_reference :subscriptions, :coupons, foreign_key: true
    add_reference :students, :addresses, foreign_key: true
    add_reference :institutions, :addresses, foreign_key: true
    add_reference :coupons, :orders, foreign_key: true
    add_reference :cycles, :subscriptions, foreign_key: true
    add_reference :transactions, :cycles, foreign_key: true
    add_reference :transactions, :payments, foreign_key: true
    add_reference :coupons, :subscriptions, foreign_key: true
  end
end
