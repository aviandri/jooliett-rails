require 'spec_helper'

describe CartsController do
	before(:each) do
		@product = FactoryGirl.create(:product)
		@product_2 = FactoryGirl.create(:product)
		@cart = FactoryGirl.create(:cart, :products => [@product, @product_2])
	end

	describe "GET 'show'" do
		it "returns http success and show cart" do
		  get 'show', :id => @cart.id
		  assigns(:cart).should_not be_nil		
		  response.should render_template("show")  
		end
	end

end
