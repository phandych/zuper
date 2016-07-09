class CartsController < ApplicationController
  def show
  	@cart_items = current_cart.cart_items
  	@shopping_cart = current_cart.number
  end
end
