require 'spec_helper'
include Devise::TestHelpers

describe ShippingDetailsController do

	before(:each) do
	  @user = FactoryGirl.create(:user)
	  @order = FactoryGirl.create(:order)
	  sign_in @user
	end
	describe "GET 'new' for new shipping details" do
	  it "it should go to new shipping details form" do
	  	get 'new', order_id: @order.id	    
	  	assigns[:order].should_not be_nil
	  end
	end

end
