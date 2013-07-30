class SessionsController < Devise::SessionsController

	def create
		super		
		if session[:order_id]
			order = Order.find(session[:order_id])
			order.user = current_user
			order.save
		end
	end


end
