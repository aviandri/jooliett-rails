class UsersController < Devise::RegistrationsController
	def new
		@user = User.new
	end

	def create
		super	
		if session[:order_id].blank?
			flash[:errors] = ["Thank you for registering, Now Let's Shop!"]
			return covers_path
		else
			order = Order.find(session[:order_id])
			order.user = current_user
			order.save
		end			
	end

	private

	def resource_params
      params.require(:user).permit(:name, :email, :password)
    end

end
