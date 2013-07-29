ActiveAdmin.register LookBook do

	form(:html => {:multipart => true}) do |f|
		f.inputs do
			f.input :name
			f.input :description
			f.has_many :look_book_images do |look_book_image|
				look_book_image.inputs do
					look_book_image.input :image, :as => :file, :hint => look_book_image.template.image_tag(look_book_image.object.image.medium.url)
				end
			end
		end
		f.actions
	end

	controller do
		def permitted_params
			 params.permit!
		end
	end

end
