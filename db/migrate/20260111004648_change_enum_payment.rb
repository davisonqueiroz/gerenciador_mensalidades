class ChangeEnumPayment < ActiveRecord::Migration[8.0]
  def change
    change_column :payments, :status, :integer, using: "status::integer", default: 0
    change_column :payments, :payment_method, :integer, using: "payment_method::integer", default: 0
  end
end
