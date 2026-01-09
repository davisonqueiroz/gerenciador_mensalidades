class Order < ApplicationRecord
  validates :full_price, :price, :status, presence: true
  validates :full_price, numericality: { greater_than: 0 }
  validates :price, numericality: { greater_than: 0 }
  validates :paid_value, numericality: { greater_than_or_equal_to: 0 }
  enum :status, registered: "registered", paid: "paid", canceled: "canceled", default: "registered"
  belongs_to :offer
  belongs_to :student
  has_one :coupon
  has_many :payment
end
