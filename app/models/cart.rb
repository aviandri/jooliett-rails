class Cart < ActiveRecord::Base
	has_many :cart_items
	has_many :products, through: :cart_items

	def add_product(product)
		avail_cart_items = self.cart_items.where(product_id: product.id)
		if cart_items.empty?
			self.products << product
		else
			avail_cart_items.first.quantity = cart_items.first.quantity.nil? ? 2 : cart_items.first.quantity + 1
			avail_cart_items.first.save
		end
		self.save		
	end
end
