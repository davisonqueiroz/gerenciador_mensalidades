class Order < ApplicationRecord
  belongs_to :offer
  belongs_to :student
  has_one :coupon
  has_many :payment
end
