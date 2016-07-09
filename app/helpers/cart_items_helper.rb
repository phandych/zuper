module CartItemsHelper
	def current_cart
		if current_user 
			if ShoppingCart.find_by_user_id(current_user.id).nil?
				ShoppingCart.new
			else
				ShoppingCart.find_by_user_id(current_user.id)
			end
		elsif session[:shopping_cart_id].nil?
			ShoppingCart.new
		end
	end

	def item_count
		current_cart.cart_items.sum(:quantity)
	end

	def cart_subtotal
		number_to_currency current_cart.cart_items.sum(:row_subtotal)
	end
end
