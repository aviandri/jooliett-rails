json.master_products @master_products.each do |master_product|
  json.id master_product.id
  json.name	master_product.name
  json.description master_product.description
  json.price master_product.price_string
  json.status master_product.status
  json.available master_product.available?
  unless json.discount_price.blank?
    json.discount_price master_product.discount_price_string
  end
  
  unless master_product.primary_product_color.nil?
  	json.images do  
  		json.full master_product.primary_product_color.primary_image.image.url
  		json.medium master_product.primary_product_color.primary_image.image.medium.url
  		json.thumb master_product.primary_product_color.primary_image.image.thumb.url
  	end
  end

  json.colors master_product.product_colors_sorted.each do |product_color|
    json.color_hex product_color.color.hex
  end
end
json.page @page