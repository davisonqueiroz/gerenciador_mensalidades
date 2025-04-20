class University < ApplicationRecord
  validates :name, presence: true
  validates [:name,:cnpj], uniqueness: true
  validates :cnpj, numericality: {only_integer: true}
  enum :type, escola:'escola',creche:'creche'
  has_many :enrollments
end
