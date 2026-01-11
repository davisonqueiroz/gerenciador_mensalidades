class Cycle < ApplicationRecord
  validates :index, :status, :value, presence: true
  enum status: { pending: 0, waiting_payment: 1, overdue: 2, finished: 3 }
  validates :index, numericality: { only_integer: true, greater_than: 0 }
  validates :value, numericality: { greater_than: 0 }
  belongs_to :subscription
  has_many :transaction
end
