class Cycle < ApplicationRecord
  validates :index, :status, :value, presence: true
  enum :status, pending: "pending", waiting_payment: "waiting_payment", overdue: "overdue", finished: "finished", default: "pending"
  validates :index, numericality: { only_integer: true, greater_than: 0 }
  validates :value, numericality: { greater_than: 0 }
  belongs_to :subscription
  has_many :transaction
end
