require 'spec_helper'

describe ProductsController do

  before(:each) do
    @category = FactoryGirl.create(:category, :name => "dress")
  	@master_product = FactoryGirl.create(:master_product, :categories => [@category])
  end

  describe "GET 'index' for new arrival" do
    it "returns http success and assigns dress categoried master_product" do
      get "index", :category_name => "dress"  
      assigns(:master_products).should eq([@master_product])
      assigns(:category).should_not be_nil
      response.should be_success
    end

    it 'returns http success and assigns empty master_product' do
    	get "index", :category_name => "unknown"  
      	assigns(:master_products).should eq([])
      	response.should be_success
    end
  end

end
