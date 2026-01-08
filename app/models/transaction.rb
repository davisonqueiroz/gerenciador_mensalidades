class Transaction < ApplicationRecord
  belongs_to :subscription
  belongs_to :cycle
  has_one :payment
end
