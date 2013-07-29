module CartsHelper

	def total_price(cart)
		total_price = 0
		cart.products.each do |product|
			total_price = total_price + product.sales_price
		end
		total_price
	end
end
