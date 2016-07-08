class ProductsController < ApplicationController
  def index
  	@products = Product.all
  	if user_signed_in?
  		@cart_item = current_user.cart_items.new
  	else
  		@cart_item = CartItem.new
  	end
  end
end
