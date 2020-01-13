class LineItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :category

  validates :quantity, :unit_price, :amount, numericality: { greater_than: 0.0 }
end
