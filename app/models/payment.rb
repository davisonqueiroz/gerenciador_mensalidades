class Payment < ApplicationRecord
  validates :value, :status, :payment_method, presence: true
  validates :value, numericality: { greater_than: 0 }
  enum :status, registered: "registered", paid: "paid", expired: "expired", canceled: "canceled", refunded: "refunded", default: "registered"
  enum :payment_method, credit_card: "credit_card", boleto: "boleto", pix: "pix", default: "credit_card"
  belongs_to :order
  belongs_to :transaction
end
