ActiveAdmin.register Confirmation do
	form :partial => "form"

	controller do
		def permitted_params
			 params.permit!
		end
	end
end
