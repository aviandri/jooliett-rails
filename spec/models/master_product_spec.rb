require 'spec_helper'

describe MasterProduct do
	let(:valid_master_product){MasterProduct.new(:name => "Dress", :description => "Dress Description", :price => 10000)}
	let(:invalid_master_product_name){MasterProduct.new()}	

	before(:each) do 
		@master_product = FactoryGirl.create(:master_product)
	end 

	describe "create" do
	   it "should be valid" do	   		
	   		valid_master_product.should be_valid	     
	   end

	   it "should not be valid" do
	   		invalid_master_product_name.should_not be_valid	 
	   		invalid_master_product_name.errors.messages.should include(:name, :description, :price)    
	   end
	 end 

	describe "find by category name" do
	  	it "it should return MasterProduct with that have a particular catory name" do	  		
			Category.any_instance.stub(:where => @master_product.categories.first)	  					
	  		MasterProduct.find_by_category_name("dress").should include(@master_product)	  		
	  	end
  	end

end	