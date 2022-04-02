class Order < ApplicationRecord
  has_many :cartitems
  has_many :lechons
  belongs_to :customer
  has_one :delivery
  accepts_nested_attributes_for :delivery

  validates :customer, presence: true

  def total_sell_price
    Lechon.where(order_id: self.id).sum { |lechon| lechon.sell_price }
  end
  def total_base_price
    Lechon.where(order_id: self.id).sum { |lechon| lechon.base_price }
  end
end
