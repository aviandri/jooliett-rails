require 'spec_helper'

describe OrdersController do

	describe "create" do
		before(:each) do
			@product = FactoryGirl.create(:product)
			@cart = FactoryGirl.create(:cart, products: [@product])  
			cookies.permanent[:cart_id] = @cart.id
		end

	  it "should initialize new order" do
	  	get :new
	  	assigns[:order].should_not be_nil
	  	response.should redirect_to(new_order_shipping_detail_path(:order_id => assigns[:order].id))
	  	assigns[:order].order_items.count.should eq(1)
	  end
	end

end
