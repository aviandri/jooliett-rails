class OrdersController < ApplicationController
	def new 
		@order = Order.new
		cart = Cart.find(cookies[:cart_id])
		cart.cart_items.each do |cart_item|
			order_item = OrderItem.create(product_id: cart_item.product_id, 
									quantity: cart_item.quantity)			
			@order.order_items << order_item
		end
		@order.save
		redirect_to new_order_shipping_detail_path(:order_id =>  @order.id)
	end


	def create		
		
	end



end
