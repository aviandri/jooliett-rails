require 'spec_helper'
include Devise::TestHelpers

describe PaymentDetailsController do

	describe "POST create" do
	  before(:each) do
	  	@user = FactoryGirl.create(:user)
	    @payment_type = FactoryGirl.create(:payment_type)
	    @order = FactoryGirl.create(:order)
	    sign_in @user
	  end

	  it "shold create payment_detail and redirected to order new" do
	    post :create, order_id: @order.id, :payment_detail => {:payment_type_id => @payment_type.id}
	  end
	end



end
