class Order < ApplicationRecord
  has_many :cartitems
  belongs_to :customer, counter_cache: true
  has_one :delivery

  validates :customer, presence: true
end
