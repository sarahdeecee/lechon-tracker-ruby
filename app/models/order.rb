class Order < ApplicationRecord
  has_many :cartitems
  has_many :lechons
  belongs_to :customer
  has_one :delivery
  accepts_nested_attributes_for :delivery

  validates :customer, presence: true

  def total_price
    50
  end
end
