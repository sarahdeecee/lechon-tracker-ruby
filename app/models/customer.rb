class Customer < ApplicationRecord
  has_many :orders

  # validates :last_name, presence: true
  # validates :last_name, presence: true
  def full_name
    "#{try(:first_name)} #{try(:last_name)}".to_s
  end
  def order_count
    Order.where(:customer_id => self.id).count
  end
  def phone_formatted
    ActiveSupport::NumberHelper.number_to_phone(self.phone)
  end
end
