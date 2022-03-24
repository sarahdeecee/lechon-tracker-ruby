class CreateOvens < ActiveRecord::Migration[7.0]
  def change
    create_table :ovens do |t|
      t.string :details

      t.timestamps
    end
  end
end
