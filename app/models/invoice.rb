class Invoice < ApplicationRecord
  validates :invoice_value,:due_date,:enrollment,:status, presence: true
  enum :status, aberta:'aberta',atrasada:'atrasada',paga:'paga', default: 'aberta'
  belongs_to :enrollment
end
