ActiveAdmin.register Product do

	form do |f|
		f.inputs do 
			f.input :master_product, :as => :select
			f.input :product_color, :as => :select, :collection => ProductColor.all.map{|p| ["#{p.color.name}", p.id]}
			f.input :product_size, :as => :select
			f.input :quantity			
			# f.input :correct_answer, :as =>  :select, :collection => [1,2,3,4,5]
		end
		f.actions
	end	

	controller do
		def permitted_params
			params.permit!
		end
	end

end
