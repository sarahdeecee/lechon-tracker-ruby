class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.timestamp :confirmed_at
      t.timestamp :pickup_at
      t.timestamp :completed_at
      t.boolean :completed, default: false
      t.string :status, default: 'Pending'
      t.integer :total_price
      t.string :payment_received, default: 'Pending'
      t.string :payment_type
      t.string :payment_holder
      t.string :notes

      t.timestamps
    end
  end
end
