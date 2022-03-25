class Order < ApplicationRecord
  has_many :lechons
  belongs_to :customer

  validates :customer, presence: true
end
