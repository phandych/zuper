class AddUserToCartItems < ActiveRecord::Migration
  def change
    add_reference :cart_items, :user, index: true, foreign_key: true
  end
end
