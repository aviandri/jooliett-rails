require 'spec_helper'
include Devise::TestHelpers

describe PaymentDetailsController do

	describe "POST create" do
	  before(:each) do
	  	@user = FactoryGirl.create(:user)
	    @payment_type = FactoryGirl.create(:payment_type)
	    sign_in @user
	  end

	  it "shold create payment_detail and redirected to order new" do
	    post :create, :payment_detail => {:payment_type_id => @payment_type.id}
	   	# assert_redirected_to "/orders/new"  
	  end
	end



end
