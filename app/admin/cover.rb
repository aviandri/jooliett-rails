ActiveAdmin.register Cover do

	form(:html => {:multipart => true}) do |f|
		f.inputs do
			f.input :status, :as => :select, :collection => ["active", "inactive"]
			f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url)
			f.input :caption, :as => :text
		end

		f.actions
	end

	controller do
		def permitted_params
			 params.permit!
		end
	end

end
