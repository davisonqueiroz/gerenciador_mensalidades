class Subscription < ApplicationRecord
  validates :status, :payment_method, :price, :paid_cycles, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :paid_cycles, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  enum :status, active: "active", inactive: "inactive", canceled: "canceled", default: "active"
  enum :payment_method, credit_card: "credit_card", boleto: "boleto", pix: "pix", default: "credit_card"
  has_many :cycle
  has_many :transaction
  belongs_to :coupon
end
