class CartItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  belongs_to :shopping_cart
  before_save :calculate
  after_create :update_subtotal2

  default_scope -> {order(id: :desc)}
  
  validates :quantity, numericality: true

  def update_subtotal2
    shopping_cart.update_attribute(:subtotal, 1)
  end

  def increment
  	item_quantity = self.quantity + 1
  	update_attribute(:quantity, item_quantity)
  end

  def unit_price
  	self.unit_price = product.price
  end

  def row_subtotal
  	subtotal = self.unit_price * self.quantity
  end

  private

  		def calculate
  			self.unit_price = unit_price
  			self.row_subtotal = row_subtotal
      end

end
