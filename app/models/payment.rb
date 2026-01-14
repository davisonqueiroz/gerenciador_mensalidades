class Payment < ApplicationRecord
  validates :value, :status, :payment_method, presence: true
  validates :value, numericality: { greater_than: 0 }
  enum status: { registered: 0, paid: 1, expired: 2, canceled: 3, refunded: 4 }
  enum payment_method: { credit_card: 0, boleto: 1, pix: 2 }
  belongs_to :order
  belongs_to :transaction
end