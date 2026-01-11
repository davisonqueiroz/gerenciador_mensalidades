class ChangeEnumSubscription < ActiveRecord::Migration[8.0]
  def change
    change_column :subscriptions, :status, :integer, using: "status::integer", default: 0
    change_column :subscriptions, :payment_method, :integer, using: "payment_method::integer", default: 0
  end
end
