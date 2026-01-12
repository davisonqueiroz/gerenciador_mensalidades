module Api
  module V2
    class Offer < ApplicationRecord
      validates :course_name, :full_price, :status, :max_payments, presence: true
      validates :full_price, numericality: { greater_than: 0 }
      validates :discount_value, numericality: { greater_than_or_equal_to: 0 },optional: true
      validates :discount_percentage, optional: true
      enum status: { active: 0, inactive: 1 }
      validates :max_payments, numericality: { only_integer: true, greater_than: 0 }
      belongs_to :institution
      has_many :order
    end
  end
end