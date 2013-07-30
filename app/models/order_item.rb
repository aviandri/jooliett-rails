class OrderItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :product

	def subtotal_price
		self.product.sales_price * self.quantity
	end

	def subtotal_price_string
		stringify_price(subtotal_price)
	end
 

	private
	def stringify_price(number)
		number.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1.').reverse
	end

end
