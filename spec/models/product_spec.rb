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

  describe "product color" do
    it "should have product color" do
      product_color = ProductColor.new
      @product.product_color = product_color
      @product.product_color.should eq(product_color)
    end

    it "should return products by product color" do
      product_color = FactoryGirl.create(:product_color)
      @product = FactoryGirl.create(:product, :product_color => product_color)
      products = Product.where(product_color: product_color)
      products.should include(@product)
    end
  end

  describe "product size" do
    it "should have product size" do
      product_size = ProductSize.new
      @product.product_size = product_size
      @product.product_size.should eq(product_size)      
    end
  end

  describe "quantity" do
    it "should have a quantity" do
      product = Product.new(:quantity => 2)
      product.quantity.should eq(2)
    end
  end

  describe "is available" do
    before(:each) do
      @product = FactoryGirl.create(:product, :quantity => 2)
      @order_item = FactoryGirl.create(:order_item, :quantity => 1, :product_id => @product.id)
    end

    it "should return true if product is available" do
      @product.available?.should eq(true)
    end

    it "should return false if product not available" do
      @product.quantity = 1
      @product.available?.should eq(false)
    end

    it "should return false if product not available multiple order item" do
      @product.quantity = 2
      FactoryGirl.create(:order_item, :quantity => 1, :product_id => @product.id)
      @product.available?.should eq(false)
    end
  end
  
end