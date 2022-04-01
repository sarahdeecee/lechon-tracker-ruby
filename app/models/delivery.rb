class Delivery < ApplicationRecord
  belongs_to :order
  belongs_to :deliverer, optional: true
end
