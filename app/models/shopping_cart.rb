class ShoppingCart < ActiveRecord::Base
	has_many :cart_items, dependent: :destroy
	has_many :product, through: :cart_items, source: :product

	


end
