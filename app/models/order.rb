class Order < ApplicationRecord
  has_many :lechons
  belongs_to :customer
  belongs_to :supplier
  belongs_to :oven
end
