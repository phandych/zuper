class CartItemsController < ApplicationController

	def create
		@cart = current_cart
		@product = Product.find(params[:product_id])
		if existing = CartItem.where(product_id: @product.id).first
			existing.increment
			redirect_to root_url
		else
			@cart_item = @cart.cart_items.new(product_id: @product.id, quantity: 1)
			@cart_item.save
			session[:shopping_cart_id] = @cart.id
			redirect_to root_url
		end
	end



	private

		def cart_params
			params.require(:cart_item).permit(:quantity, :product_id)
		end

end
