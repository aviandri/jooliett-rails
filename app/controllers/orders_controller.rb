class OrdersController < ApplicationController

	def create
		@order = Order.new
		cart = Cart.find(params[:cart_id])
		# cart.cart_items.each do |cart_item|
			
		# end

		redirect_to controller: :shipping_details, action: :new
	end



end
