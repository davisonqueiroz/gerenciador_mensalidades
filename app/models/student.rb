class Student < ApplicationRecord
  validates :name, :cpf, :gender, :payment_method, presence: true
  validates :name, :cpf, uniqueness: true
  validates :cpf, numericality: { only_integer: true }

  enum :gender, masculine: "masculine", feminine: "feminine"
  enum :payment_method, boleto: "boleto", cartao: "cartão"
  has_many :enrollments
end
