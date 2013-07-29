class UsersController < Devise::RegistrationsController
	def new
		@user = User.new
	end

	def create
		super		
		order = Order.find(session[:order_id])
		order.user = current_user
		order.save
	end

	private

	def resource_params
      params.require(:user).permit(:name, :email, :password)
    end

end
