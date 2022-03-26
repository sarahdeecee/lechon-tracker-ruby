class CartItem < ApplicationRecord
  belongs_to :order
  belongs_to :lechon
end
