class CartItem < ApplicationRecord
  belongs_to :order
  has_many :lechons
end
