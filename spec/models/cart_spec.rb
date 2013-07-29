require 'spec_helper'


describe Cart do
  before(:each) do
  	@product = FactoryGirl.create(:product)
  	@cart = FactoryGirl.create(:cart, :products => [@product])
  end
  describe "products" do
    it "should have multiple products" do
      @cart.products.should_not be_nil
    end
    it "should return a list of product" do
    	@cart.products.should include(@product)
    end
  end

  describe "status" do
    it "should have status" do
      @cart.status.should be_nil
    end
  end

  describe "reserved product quantity" do
    before(:each) do
      @product = FactoryGirl.create(:product, :quantity => 2)
      @cart_item = FactoryGirl.create(:cart_item, :quantity => 1, :product => @product)
      @cart = FactoryGirl.create(:cart, :cart_items => [@cart_item])      
    end
    it "should return reserver product quantity" do
      @cart.reserved_product_quantity(@product).should eq(1)     
    end
  end

end
