class RemoveTotalFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column(:orders, :total_sell_price)
  end
end
