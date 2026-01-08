class Subscription < ApplicationRecord
  has_many :cycle
  has_many :transaction
  belongs_to :coupon
end
