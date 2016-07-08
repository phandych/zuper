class CartItemsController < ApplicationController
	before_action :authenticate_user!

	def create
		@product = Product.find(params[:product_id])
		if  existing = current_user.cart_items.where(product_id: @product.id).first
			existing.increment
		else
			@cart_item = current_user.cart_items.new(product_id: @product.id, quantity: 1)
			@cart_item.save
		end
		respond_to do |format|
			format.html { redirect_to root_url }
			format.js
		end
	end

	# def update
	#	@product = Product.find(params[:product_ids])
	#	@cart_item = current_user.cart_items.where(product_id: @product.id).first
	#	@cart_item.update_attributes(cart_params)
	#	redirect_to cart_path
	# end

	def update_cart
		CartItem.update(params[:cart_item].keys, params[:cart_item].values)
		redirect_to cart_path
	end


	private

		def cart_params
			params.require(:cart_item).permit(:quantity)
		end

end
