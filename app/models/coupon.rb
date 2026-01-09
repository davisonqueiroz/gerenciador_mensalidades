class Coupon < ApplicationRecord
  validates :course_name, :full_price, :status, :description, :warnings, presence: true
  validates :paid_value, numericality: { greater_than_or_equal_to: 0 }
  validates :full_price, numericality: { greater_than: 0 }
  belongs_to :order
  has_one :subscription
end
