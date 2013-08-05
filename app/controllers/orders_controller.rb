class OrdersController < ApplicationController	
	before_filter :authenticate_user!, :only => ["summary", "complete"]
	
	def new 
		@order = Order.new
		cart = Cart.find(cookies[:cart_id])
		cart.cart_items.each do |cart_item|
			order_item = OrderItem.create(product_id: cart_item.product_id, 
									quantity: cart_item.quantity)			
			@order.order_items << order_item
		end
		@order.save
		session[:order_id] = @order.id
		redirect_to new_order_shipping_detail_path(:order_id =>  @order.id)
	end

	def summary		
		@order = Order.find params[:id]
		check_ownership(@order)
		
	end

	def complete
		cart = Cart.find(cookies[:cart_id])
		unless cart.nil?
			cart.invalidate_cart			
		end
		@order = Order.find params[:id]
		check_ownership(@order)
		@order.invoice_code = SecureRandom.hex(10)
		@order.status = "pending"
		if @order.save
			PaymentMailerWorker.perform_async(@order.id)
		end
	end

	private 
	def check_ownership(order)
		unless order.user == current_user
			redirect_to :controller => "covers", :action => "index"
		end
	end
end
