ActiveAdmin.register Order do
	action_item :only => :show do	  	
		link_to 'approve', approve_admin_order_path(order.id), :method => :put	  	
	end

	member_action :approve, :method => :put do
	    order = Order.find params[:id]
	    order.complete_order
	    redirect_to admin_orders_path
  	end

	index do       
		column :id                  
		column :user   
	    column :total_price     
	    column :status
	    column :invoice_code
	    column :created_at
	    column :updated_at
      column("Action") do |order|
        link_to("Send Confirmation Email", new_admin_confirmation_path(:order_id => order.id))         
      end    

	    default_actions                   
	end  


  show do |order|
  	 attributes_table do  		
  		row :total_price  
  		row :status
  		table_for(order.order_items) do |t|		
  			t.column "image" do |order_item|
  				 image_tag(order_item.product.product_color.primary_image.image.thumb.url)
  			end

  			t.column "name" do |order_item|
  				 order_item.product.name
  			end
  			t.column "size" do |order_item|
  				 order_item.product.product_size.name
  			end
  			t.column "color" do |order_item|
  				 order_item.product.product_color.name
  			end
  			t.column "quantity" do |order_item|
  				 order_item.quantity
  			end
  		end
  	  end
  	  panel "user detail" do
  	  	attributes_table_for order.user do
  	  		row "name" do |user| 
  	  			user.name 
  	  		end
  	  		row "email" do |user| 
  	  			user.email 
  	  		end
  	  		row "address" do |user| 
  	  			order.shipping_detail.full_address
  	  		end
  	  		row "city" do |user|   	  			
  	  			"#{order.shipping_detail.city.name}/#{order.shipping_detail.city.state.name}"
  	  		end
  	  	end
  	  end

  	  panel "payment detail" do
  	  	attributes_table_for order.payment_detail do
  	  		row "payment type" do |payment_detail| 
  	  			payment_detail.payment_type.full_description
  	  		end  	  		
  	  	end
  	  end	 
  end



end
