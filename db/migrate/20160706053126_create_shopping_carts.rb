class CreateShoppingCarts < ActiveRecord::Migration
  def change
    create_table :shopping_carts do |t|
      t.decimal :subtotal
      t.decimal :total

      t.timestamps null: false
    end
  end
end
