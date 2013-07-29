require 'spec_helper'

describe CartItem do
  
  describe "valid" do
    it "should be valid" do
      	cart_item = CartItem.new
      	cart_item.cart.should be_nil
      	cart_item.product.should be_nil
      	cart_item.quantity.should be_nil
    end
    it "should have default quantity value of 1" do
      	cart_item = CartItem.create
      	cart_item.quantity.should eq(1)	
    end
  end
end
