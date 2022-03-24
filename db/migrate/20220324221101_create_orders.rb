class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :customer_id, null: false, foreign_key: true
      t.references :supplier_id, null: false, foreign_key: true
      t.references :oven_id, null: false, foreign_key: true
      t.timestamp :confirmed_at
      t.timestamp :pickup_at
      t.timestamp :cook_start
      t.timestamp :cook_end
      t.timestamp :completed_at
      t.boolean :completed
      t.boolean :delivery
      t.integer :delivery_charge
      t.string :status
      t.integer :total_price
      t.string :payment_received
      t.string :payment_type
      t.string :payment_holder
      t.string :notes

      t.timestamps
    end
  end
end
