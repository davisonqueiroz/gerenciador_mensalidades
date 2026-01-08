class Coupon < ApplicationRecord
  belongs_to :order
  has_one :subscription
end
