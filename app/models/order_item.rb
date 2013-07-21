class OrderItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :product

	def subtotal_price
		self.product.sales_price * self.quantity
	end
end
