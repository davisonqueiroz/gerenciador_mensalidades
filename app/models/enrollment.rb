class Enrollment < ApplicationRecord
  belongs_to :university
  belongs_to :student
end
