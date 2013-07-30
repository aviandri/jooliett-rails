class CartItem < ActiveRecord::Base
	belongs_to :product
	belongs_to :cart
	before_save :init_default_value


	def sub_total
		product.price * quantity
	end
	def sub_total_string
		stringify_price(sub_total)
	end

	private 
	def init_default_value
		self.quantity = 1 if self.quantity.nil?
	end

	private
	def stringify_price(number)
		number.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1.').reverse
	end




end
