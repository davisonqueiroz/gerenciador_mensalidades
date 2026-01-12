module Api
  module V2
    class Address < ApplicationRecord
      validates :city, :state, :address, :zipcode, :neighborhood, presence: true
      validates :address_number, numericality: { only_integer: true }
      validates :zipcode, numericality: { only_integer: true }, length: { in: 8..9 }, format: { with: /\d{5}-?\d{3}/}
      belongs_to :institution
      belongs_to :student
    end
  end
end