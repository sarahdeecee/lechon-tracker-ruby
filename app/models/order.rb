class Order < ApplicationRecord
  belongs_to :customer_id
  belongs_to :supplier_id
  belongs_to :oven_id
end
