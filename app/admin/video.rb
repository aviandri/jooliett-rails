ActiveAdmin.register Video do
form(:html => {:multipart => true}) do |f|
		f.inputs do			
			f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url)
		end
		f.actions
	end	

controller do
	def permitted_params
		 params.permit!
	end
end

end
