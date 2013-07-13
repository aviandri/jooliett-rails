require 'spec_helper'

describe Product do

  before(:each) do
  		@master_product = FactoryGirl.create(:master_product)
  		@product = FactoryGirl.create(:product, :master_product => @master_product)  		
  end
  
  describe "should be valid" do
    it "contain name" do
    	@product.name.should eq "Dress"      
    end   
  end  

  describe "belongs to master product" do
  	it "should belongs to master product" do
  		@product.master_product.should eq(@master_product)
  	end
  end

  describe "primary product" do
  	it "have attribute primary" do
    	@product.primary?.should_not be_nil
    end
    it "should be a primary item" do
    	primary_product = Product.new(:primary => true)
    	primary_product.primary?.should eq(true)
    end
    it "should not be primary item" do
    	primary_product = Product.new(:primary => false)
    	primary_product.primary?.should eq(false)

    	primary_product = Product.new(:primary => nil)
    	primary_product.primary?.should eq(false)
    end

    it "should be a primary item from scope" do
    	primary_product = FactoryGirl.create(:product, :primary => true)
    	Product.primaries.should eq([primary_product])
    end
  end

  describe "image" do
      it "should create image url" do
        @product.image.url.should_not be_nil
      end
      it "should create medium url" do
        @product.image.medium.url.should_not be_nil
      end
      it "should create thumb url" do
        @product.image.thumb.url.should_not be_nil
      end
    end
  
end