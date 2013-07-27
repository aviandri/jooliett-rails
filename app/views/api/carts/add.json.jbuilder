if @error
	json.error "product not available"
else
	json.cart do
		json.count @cart.products.empty? ? 0 : @cart.products.count
		json.cart_items do
			json.count 	@cart.products.empty? ? 0 : @cart.products.count
			json.array! @cart.cart_items do |cart_item|
				json.name cart_item.product.name
				json.thumb_img cart_item.product.product_color.primary_image.image.thumb.url
				json.price cart_item.product.sales_price
				json.quantity cart_item.quantity
			end
		end

	end
	
end