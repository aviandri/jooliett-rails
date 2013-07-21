require 'spec_helper'

describe OrdersController do

	describe "create" do
		before(:each) do
			@product = FactoryGirl.create(:product)
			@cart = FactoryGirl.create(:cart, products: [@product])  
		end

	  it "should create new order" do
	  	post :create, cart_id: @cart.id	    
	  	assigns[:order].should_not be_nil
	  	response.should redirected_to(new_shipping_detail_path)
	  end
	end

end
