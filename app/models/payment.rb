class Payment < ApplicationRecord
  belongs_to :order
  belongs_to :transaction
end
