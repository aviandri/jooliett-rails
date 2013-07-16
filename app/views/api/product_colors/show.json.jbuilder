json.name            @product_color.color.name
json.product_images do
	json.array! @product_color.product_images do |product_image|
	  json.full_img product_image.image.url
	  json.medium_img product_image.image.medium.url
	  json.thumb_img product_image.image.thumb.url
	  json.primary product_image.primary
	end

	
end
