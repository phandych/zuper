class ShoppingCart < ActiveRecord::Base
	has_many :cart_items, dependent: :destroy
	has_many :products, through: :cart_items
	belongs_to :user
	before_save :update_subtotal

	def subtotal
   		cart_items.collect { |ci| ci.valid? ? (ci.quantity * ci.unit_price) : 0 }.sum
  	end

  	def number
      id ? id.to_s.rjust(6, '0') : nil
    end
private

  def update_subtotal
    self[:subtotal] = subtotal
  end

	

end
