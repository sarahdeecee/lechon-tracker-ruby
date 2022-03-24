class CreateSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.primary_key :id
      t.string :company_name
      t.string :address
      t.string :notes

      t.timestamps
    end
  end
end
