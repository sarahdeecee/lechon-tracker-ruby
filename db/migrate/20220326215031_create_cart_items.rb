class CreateCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :lechon, null: false, foreign_key: true
      t.integer :quantity
      t.integer :item_price_cents
      t.integer :total_sell_price_cents

      t.timestamps
    end
  end
end
