class Institution < ApplicationRecord
  validates :name, :cnpj, :type, :status, presence: true
  validates :cnpj, numericality: { only_integer: true }, length: { is: 18 }, format: { with: /\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}/ }
  enum :status, active: "active", inactive: "inactive", partnership: "partnership", default: "active"
  enum :type, university: "university", school: "school", default: "university"
  has_many :offer
  has_many :student
  has_one :address
end
