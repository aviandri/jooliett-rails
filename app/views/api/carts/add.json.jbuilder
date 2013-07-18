json.products do
	json.array! @cart.products do |product|
		json.name product.master_product.name
		json.price product.master_product.price
		json.discount_price product.master_product.discount_price
		json.thumb_img	product.product_color.primary_image.image.thumb.url
	end
end