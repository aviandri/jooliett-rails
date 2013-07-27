require 'spec_helper'
require 'pry'

describe Api::ProductsController do

	describe "GET 'index'" do
		before(:each) do
			@master_product = FactoryGirl.create(:master_product)	  
		end

		it "should return http success and a list of master products" do
			get :index, :format => :json
			assigns[:master_products].should_not be_nil
		end
	end

end
