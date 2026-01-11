class Coupon < ApplicationRecord
  validates :course_name, :full_price, :status, :description, :warnings, presence: true
  validates :paid_value, numericality: { greater_than_or_equal_to: 0 }
  validates :full_price, numericality: { greater_than: 0 }
  store_accessor :student_data, :first_name, :second_name, :cpf, :gender
  store_accessor :address_offer, :address, :address_adjunct, :address_number, :neighborhood, :city, :state, :zipcode
  belongs_to :order
  has_one :subscription
end
