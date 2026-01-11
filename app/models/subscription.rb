class Subscription < ApplicationRecord
  validates :status, :payment_method, :price, :paid_cycles, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :paid_cycles, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  enum status:{ active: 0, inactive: 1, canceled: 2 }
  enum payment_method: { credit_card: 0, boleto: 1, pix: 2 }
  has_many :cycle
  has_many :transaction
  belongs_to :coupon
end
