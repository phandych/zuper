class ShoppingCart < ActiveRecord::Base
	has_many :cart_items, dependent: :destroy
	has_many :products, through: :cart_items
	before_update :update_subtotal

	def subtotal
		cart_items.collect { |ci| ci.valid? ? (ci.quantity * ci.unit_price) : 0 }.sum
	end

	private

		def update_subtotal
			self.subtotal = subtotal
			save
		end

	

end
