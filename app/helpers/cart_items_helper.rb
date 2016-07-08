module CartItemsHelper
	def current_cart
		if session[:shopping_cart_id].nil?
			ShoppingCart.new
		else
			ShoppingCart.find(session[:shopping_cart_id])
		end
	end
end
