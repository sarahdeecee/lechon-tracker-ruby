class ChangeCartToLechonOptions < ActiveRecord::Migration[7.0]
  def change
    remove_reference :cart_items, :lechon, foreign_key: true
    add_reference :cart_items, :lechon_option, foreign_key: true
  end
end
