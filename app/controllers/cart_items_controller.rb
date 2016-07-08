class CartItemsController < ApplicationController

	def create
		@cart = current_cart
		@product = Product.find(params[:product_id])
		if  existing = @cart.cart_items.where(product_id: @product.id).first
			existing.increment
			existing.save
		else
			@cart_item = @cart.cart_items.new(product_id: @product.id, quantity: 1)
			@cart_item.save
			session[:shopping_cart_id] = @cart.id
		end
		redirect_to root_url
	end




end
