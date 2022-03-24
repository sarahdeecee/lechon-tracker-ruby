class Delivery < ApplicationRecord
  belongs_to :order_id
  belongs_to :deliverer_id
end
