class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.primary_key :id
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :note
      t.timestamp :created_at

      t.timestamps
    end
  end
end
