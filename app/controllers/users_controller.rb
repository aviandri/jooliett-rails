class UsersController < Devise::RegistrationsController
	def new
		@user = User.new
	end

	def create
		super		
	end

	private

	def resource_params
      params.require(:user).permit(:name, :email, :password)
    end

end
