module Api
  module V2
    class Transaction < ApplicationRecord
      validates :cycle_index, :status, :payment_method, presence: true
      enum status: {registered: 0, paid: 1, failed: 2, canceled: 3 }
      enum payment_method: { credit_card: 0, boleto: 1, pix: 2 }
      validates :cycle_index, numericality: { only_integer: true, greater_than: 0 }
      belongs_to :subscription
      belongs_to :cycle
      has_one :payment
    end
  end
end
