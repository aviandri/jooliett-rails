class Api::CartsController < ApplicationController
	respond_to :json

	def add
		if cookies[:cart_id]
			@cart = Cart.find(cookies[:cart_id])		
		else
			@cart = Cart.create
			cookies.permanent[:cart_id] = @cart.id		
		end
		product = Product.find_by_product_color_product_size(params[:product_size_id], params[:product_size_id])
		@cart.products << product
		@cart.save		
	end
end
