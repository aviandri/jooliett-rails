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

    def after_sign_up_path_for(resource)
    	if resource.class.name == "User"
    		new_shipping_detail_path
    	end
    end
end
