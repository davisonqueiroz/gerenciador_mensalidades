class Enrollment < ApplicationRecord
  validates :total_value,:invoice_quantity,:due_day,:course_name,:university,:student, presence: true
  validates :total_value, numericality: {only_integer: true, greater_than: 0}
  validates :invoice_quantity, numericality: {only_integer: true, greater_than_or_equal_to: 1}
  validates :due_day, numericality: {only_integer: true, greater_than_or_equal_to: 1,less_than_or_equal_to: 31}
  belongs_to :university
  belongs_to :student
  has_many :invoices
end
