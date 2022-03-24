class CreateLechons < ActiveRecord::Migration[7.0]
  def change
    create_table :lechons do |t|
      t.string :size
      t.integer :weight
      t.integer :base_price
      t.integer :sell_price

      t.timestamps
    end
  end
end
