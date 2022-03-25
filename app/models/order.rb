class Order < ApplicationRecord
  has_many :order_items
  has_many :lechons, :through => :order_items
  belongs_to :customer
  belongs_to :supplier
  belongs_to :oven
end
