class CreateLechons < ActiveRecord::Migration[7.0]
  def change
    create_table :lechons do |t|
      t.references :supplier, foreign_key: true
      t.references :oven, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.string :size
      t.integer :base_price
      t.integer :sell_price
      t.integer :weight
      t.boolean :ordered, default: false
      t.timestamp :cook_start
      t.timestamp :cook_end

      t.timestamps
    end
  end
end
