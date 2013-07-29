require 'spec_helper'
require 'pry'

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

	describe "summary" do
		before(:each) do
		  @order = FactoryGirl.create(:order)
		end
	  it "should give http response success" do
	    get :summary, id: @order.id
	    assigns[:order].should_not be_nil
	  end
	end

	describe "complete" do
		before(:each) do
		  @order = FactoryGirl.create(:order)
		end
		it "should give http response success" do
			patch :complete, id: @order.id
			assigns[:order].status.should eq("pending")
		end		
	end

end
