require 'spec_helper'
require 'pry'

describe MasterProduct do
	let(:valid_master_product){MasterProduct.new(:name => "Dress", :description => "Dress Description", :price => 10000)}
	let(:invalid_master_product_name){MasterProduct.new()}	

	before(:each) do 
		@category = FactoryGirl.create(:category, :name => "dress")
		@master_product = FactoryGirl.create(:master_product, :categories => [@category])
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
	  	it "should return MasterProduct with that have a particular catory name" do	  		
			Category.any_instance.stub(:where => @master_product.categories.first)	  					
	  		MasterProduct.find_by_category_name("dress").should include(@master_product)	  		
	  	end
  	end

  	describe "products" do
  		it "should return empty product" do
  			@master_product.products.should eq([])
  		end
  	end
  	describe "primary product" do
  		it "should return product of this master item primary flag true" do
  			master_product = FactoryGirl.create(:master_product)
			product = FactoryGirl.create(:product, :master_product => master_product, :primary => true)
  			master_product.primary_product.should eq(product)
  		end

  		it "should return first product if don't have any primary flag products" do
  			master_product = FactoryGirl.create(:master_product)
			product = FactoryGirl.create(:product, :master_product => master_product)
  			master_product.primary_product.should eq(product)
  		end
  	end 

  	describe "product colors" do
  	 	 it "should have product colors" do
  	 	    @master_product.product_colors.should_not be_nil
  	 	 end
  	 end 	

  	 describe "colors" do
  	   	it "should have multiple colors" do
  	     	@master_product.colors.should_not be_nil	
  	   	end
  	 end

  	 describe "primaries" do
  	  	before do
  	  		@product_color = FactoryGirl.create(:product_color, :primary => true)
  	     	@master_product = FactoryGirl.create(:master_product, :product_colors => [@product_color])
  	     	@product_color_not_primary = FactoryGirl.create(:product_color)
  	     	@master_product_no_primary = FactoryGirl.create(:master_product, :product_colors => [@product_color_not_primary])

  	 	end
  	   it "should description" do  	   		
  	     	@master_product.product_colors.primaries.should include(@product_color)
  	   end

  	   it "should return primary product when it have primary product color" do
  	     	@master_product.primary_product_color.should eq(@product_color)
  	   end

  	   it "should return primary product of first product color if no primary product color" do
  	   		@master_product_no_primary.primary_product_color.should eq(@product_color_not_primary)
  		end

  		it "should return nil product color" do
  	   		master_product = FactoryGirl.create(:master_product)
  	   		master_product.primary_product_color.should be_nil
  		end
  	 end
  	 
end	