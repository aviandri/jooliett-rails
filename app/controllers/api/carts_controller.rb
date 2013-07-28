class Api::CartsController < ApplicationController
	respond_to :json

	def add
		unless cookies[:cart_id].blank?
			@cart = Cart.find(cookies[:cart_id])		
		else
			@cart = Cart.create
			cookies.permanent[:cart_id] = @cart.id		
		end
		@product = Product.find_by_product_color_product_size(params[:product_size_id], params[:product_color_id])		
		if @product.available?
			@cart.add_product(@product)		
		else
			@error = "Product not available"
		end
	end
end
