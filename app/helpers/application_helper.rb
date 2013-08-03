module ApplicationHelper

	def cart_product_quantity(cart_item)
		cart_item.quantity.nil? ? "" : "(#{cart_item.quantity})"
	end

	def cart_product_price(cart_item)
		cart_item.quantity.nil? ? cart_item.product.sales_price : cart_item.product.sales_price * cart_item.quantity 
	end

	def product_price(product)
		price = product.discount_price.nil? ? product.price : product.discount_price
	end

	def error_flag(resource, field)
		"error" unless resource.errors[field.to_sym].empty? 
	end

	def error_message(resource, field)
		resource.errors.messages[field.to_sym].first unless resource.errors[field.to_sym].empty?
	end

	def resource_name
    	:user
  	end

  	def resource
    	@resource ||= User.new
  	end

  	def devise_mapping
    	@devise_mapping ||= Devise.mappings[:user]
  	end

  	def stringify_price(number)
  		number.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1.').reverse
  	end

end
