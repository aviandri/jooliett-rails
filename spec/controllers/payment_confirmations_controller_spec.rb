require 'spec_helper'

describe PaymentConfirmationsController do

	describe "GET 'show'" do
	  before(:each) do
	  	@order = FactoryGirl.create(:order)	    
	  end
	  it "should return http success" do
	  		get "show", :invoice_code => @order.invoice_code
	  		assigns[:order].should_not be_nil
	  		assigns[:payment_confirmation].should_not be_nil	    
	  end
	end
end
