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

end
