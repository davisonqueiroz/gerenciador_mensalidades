class Institution < ApplicationRecord
  has_many :offer
  has_many :student
  has_one :address
end
