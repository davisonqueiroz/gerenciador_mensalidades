class Transaction < ApplicationRecord
  validates :cycle_index, :status, :payment_method, presence: true
  enum :status, registered: "registered", paid: "paid", failed: "failed", canceled: "canceled", default: "registered"
  enum :payment_method, credit_card: "credit_card", boleto: "boleto", pix: "pix", default: "credit_card"
  validates :cycle_index, numericality: { only_integer: true, greater_than: 0 }
  belongs_to :subscription
  belongs_to :cycle
  has_one :payment
end
