ActiveAdmin.register Product do

	form :partial => "form"

	index do       
		column :id                     
	    column :master_product     
	    column :product_color
	    column :product_size
	    column :quantity            
	    column("available quantity"){|q|q.available_quantity}               
	    default_actions                   
  	end  

	controller do
		def permitted_params
			params.permit!
		end
	end

end
