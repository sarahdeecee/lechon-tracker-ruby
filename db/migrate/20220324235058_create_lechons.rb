class CreateLechons < ActiveRecord::Migration[7.0]
  def change
    create_table :lechons do |t|
      t.references :supplier, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.references :oven, null: false, foreign_key: true
      t.string :size
      t.integer :weight
      t.integer :base_price
      t.integer :sell_price
      t.boolean :ordered, default: false
      t.timestamp :cook_start
      t.timestamp :cook_end

      t.timestamps
    end
  end
end
