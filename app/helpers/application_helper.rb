module ApplicationHelper

	def cart_product_quantity(cart_item)
		cart_item.quantity.nil? ? "" : "(#{cart_item.quantity})"
	end

	def cart_product_price(cart_item)
		price = product_price(cart_item.product)
		cart_item.quantity.nil? ? price : price * cart_item.product.quantity 
	end

	def product_price(product)
		price = product.discount_price.nil? ? product.price : product.discount_price
	end

end
