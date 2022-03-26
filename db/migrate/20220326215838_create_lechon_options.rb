class CreateLechonOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :lechon_options do |t|
      t.string :size
      t.integer :base_price
      t.integer :sell_price
      t.string :description

      t.timestamps
    end
  end
end
