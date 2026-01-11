class Institution < ApplicationRecord
  validates :name, :cnpj, :type, :status, presence: true
  validates :cnpj, numericality: { only_integer: true }, length: { is: 18 }, format: { with: /\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}/ }
  enum status: { active: 0, inactive: 1, partnership: 2 }
  enum type: { university: 0, school: 1, technical_school: 2 }
  has_many :offer
  has_many :student
  has_one :address
end
