class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   helper_method :current_cart

  		def current_cart
  			if session[:shopping_cart_id].nil?
  				ShoppingCart.new
  			else
  				ShoppingCart.find_by(id: session[:shopping_cart_id])
  			end
		
		end
end
