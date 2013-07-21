require 'spec_helper'

describe OrderItem do
  
  describe "description" do
    it "should be valid" do
      	@order_item = FactoryGirl.create(:order_item)
      	@order_item.order.should be_nil
    end
  end
end
