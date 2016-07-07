module CartItemsHelper
	def carted(cart)
		session[:shopping_cart_id] = cart.id
	end

	def current_cart
		if session[:shopping_cart_id]
			ShoppingCart.find(session[:shopping_cart_id])
		else
			ShoppingCart.new
		end
	end
end
