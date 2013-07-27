json.master_products @master_products.each do |master_product|
  json.id master_product.id
  json.name	master_product.name
  json.description master_product.description
  json.price master_product.sales_price
  unless master_product.primary_product_color.nil?
  	json.images do  
  		json.full master_product.primary_product_color.primary_image.image.url
  		json.medium master_product.primary_product_color.primary_image.image.medium.url
  		json.thumb master_product.primary_product_color.primary_image.image.thumb.url
  	end
  end
end
json.page @page