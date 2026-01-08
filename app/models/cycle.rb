class Cycle < ApplicationRecord
  belongs_to :subscription
  has_many :transaction
end
