class CartItem < ActiveRecord::Base
	belongs_to :product
	belongs_to :cart
	before_save :init_default_value

	private 
	def init_default_value
		self.quantity = 1 if self.quantity.nil?
	end



end
