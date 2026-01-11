class ChangeEnumOffer < ActiveRecord::Migration[8.0]
  def change
    change_column :offers, :status, :integer, using: "status::integer", default: 0
  end
end
