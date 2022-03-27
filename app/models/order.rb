class Order < ApplicationRecord
  has_many :cartitems
  belongs_to :customer

  validates :customer, presence: true
end
