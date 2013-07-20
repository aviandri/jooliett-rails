require 'spec_helper'

describe ShippingDetailsController do

	describe "GET 'new' for new shipping details" do
	  it "it should go to new shipping details form" do
	  	get 'new'	    
	  	assigns[:shipping_detail].should_not be_nil
	  end
	end

end
