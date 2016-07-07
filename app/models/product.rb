class Product < ActiveRecord::Base
	has_many :cart_items, dependent: :destroy
	has_many :shopping_cart, through: :cart_items
end
