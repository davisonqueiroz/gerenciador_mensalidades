class Offer < ApplicationRecord
  belongs_to :institution
  has_many :order
end
