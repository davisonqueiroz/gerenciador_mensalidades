class AddAddressOfferToCoupon < ActiveRecord::Migration[8.0]
  def change
    add_column :coupons, :address_offer, :jsonb, default: {}
  end
end
