ActiveAdmin.register MasterProduct do

form(:html => {:multipart => true}) do |f|
	f.inputs do
	f.input :name         
	f.input :description 
	f.input :price
	f.input :discount_price
	f.input :discount_percentage
	f.has_many :product_colors do |product_color| 
		product_color.inputs do 
			product_color.input :color,  :as => :select,      :collection => Color.all
			product_color.input :primary 
			product_color.has_many :product_images do |product_image|
				product_image.inputs do
					product_image.input :primary
					product_image.input :image, :as => :file, :hint => product_image.template.image_tag(product_image.object.image.thumb.url)
				end
			end
		end
	end
	f.input :product_sizes, :as => :check_boxes, :collection => ProductSize.all
	f.input :categories, :as => :check_boxes, :collection => Category.all	      
	  
	end
    f.actions
end

controller do
	def permitted_params
		 params.permit!
	end
end

end
