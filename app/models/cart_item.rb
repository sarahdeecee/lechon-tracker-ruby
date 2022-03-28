class CartItem < ApplicationRecord
  belongs_to :order
  has_many :lechons

  monetize :item_price_cents, numericality: true
  monetize :total_price_cents, numericality: true
end
