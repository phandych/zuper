class CartsController < ApplicationController
  def show
  	@carts = current_cart.cart_items
  end
end
