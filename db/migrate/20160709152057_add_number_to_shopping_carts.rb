class AddNumberToShoppingCarts < ActiveRecord::Migration
  def change
    add_column :shopping_carts, :number, :integer
  end
end
