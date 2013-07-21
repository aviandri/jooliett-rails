require 'spec_helper'

describe Order do

	before(:each) do
		@order = FactoryGirl.create(:order)
	end
 	
 	describe "create" do
 	  it "should be valid" do
 	    @order.payment_detail.should_not be_nil
 	    @order.shipping_detail.should_not be_nil 	    
 	    @order.user.should_not be_nil
 	  end
 	end

 	describe "order_items" do
 	  it "order_items should not be nil" do
 	    @order.order_items.should_not be_nil
 	  end
 	end
end
