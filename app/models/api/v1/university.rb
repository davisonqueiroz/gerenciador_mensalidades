module Api
  module V1
    class University < ApplicationRecord
      validates :name, presence: true
      validates :name, :cnpj, uniqueness: true
      validates :cnpj, numericality: { only_integer: true }
      enum :university_type, escola: "escola", creche: "creche"
      has_many :enrollments, dependent: :destroy
    end
  end
end