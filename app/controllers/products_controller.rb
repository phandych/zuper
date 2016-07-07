class ProductsController < ApplicationController
  def index
  	@products = Product.all
  	@cart_item = current_cart.cart_items.new
  end
end
