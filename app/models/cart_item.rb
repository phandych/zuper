class CartItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :shopping_cart

  validates :quantity, numericality: true
  

  def increment
  	item_quantity = self.quantity + 1
  	update_attribute(:quantity, item_quantity)
  end
 
end
