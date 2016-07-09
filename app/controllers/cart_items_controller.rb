class CartItemsController < ApplicationController
	before_action :authenticate_user!

	def create
		@cart = current_cart
		@product = Product.find(params[:product_id])
		if  @cart_item = @cart.cart_items.where(product_id: @product.id).first
			@cart_item.increment
		else
			@cart_item = @cart.cart_items.new(cart_params)
			@cart.user_id = current_user.id
		end
		@cart_item.save
		@cart.save
		redirect_to root_url
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
			params.require(:cart_item).permit(:quantity, :product_id)
		end

end
