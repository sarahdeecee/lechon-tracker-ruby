class Order < ApplicationRecord
  has_many :cartitems
  belongs_to :customer
  has_one :delivery

  validates :customer, presence: true
end
