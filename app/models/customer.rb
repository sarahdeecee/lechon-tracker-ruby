class Customer < ApplicationRecord
  has_many :orders

  def full_name
    "#{try(:first_name)} #{try(:last_name)}".to_s
  end
end
