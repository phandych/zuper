class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.references :product, index: true, foreign_key: true
      t.references :shopping_cart, index: true, foreign_key: true
      t.integer :quantity
      t.decimal :unit_price
      t.decimal :row_subtotal

      t.timestamps null: false
    end
  end
end
