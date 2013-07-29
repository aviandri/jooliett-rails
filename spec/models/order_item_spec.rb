require 'spec_helper'

describe OrderItem do
  
  describe "description" do
    it "should be valid" do
      	@order_item = FactoryGirl.create(:order_item)
      	@order_item.order.should be_nil
    end
  end

  describe "product" do
    it "should belong to product" do
      	@order_item  = OrderItem.new
      	@order_item.product.should be_nil
    end
  end

  describe "subtotal_price" do
  	before(:each) do
  	  @master_product = FactoryGirl.create(:master_product, :price => 100000, :discount_price => 50000)
  	  @product = FactoryGirl.create(:product, :master_product => @master_product)
  	  @order_item = FactoryGirl.create(:order_item, :quantity => 4, :product => @product)
  	end
    it "should have correct subtotal price" do
      @order_item.subtotal_price.should eq(@order_item.product.sales_price * @order_item.quantity)
    end
  end
end
