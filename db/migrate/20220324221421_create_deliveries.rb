class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.references :order_id, null: false, foreign_key: true
      t.references :deliverer_id, null: false, foreign_key: true
      t.timestamp :scheduled_at
      t.timestamp :arrival_at
      t.string :location
      t.string :address

      t.timestamps
    end
  end
end
