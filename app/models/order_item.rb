class OrderItem < ApplicationRecord
  belongs_to :order_id
  belongs_to :lechon_id
end
