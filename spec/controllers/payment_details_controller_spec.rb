require 'spec_helper'
require 'pry'
include Devise::TestHelpers

describe PaymentDetailsController do

	describe "POST create" do
	  before(:each) do
	  	@user = FactoryGirl.create(:user)
	    @payment_type = FactoryGirl.create(:payment_type)
	    @order_item = FactoryGirl.create(:order_item)
	    @order = FactoryGirl.create(:order, :order_items => [@order_item])
	    sign_in @user
	  end

	  it "shold create payment_detail and redirected to order new" do
	    post :create, order_id: @order.id, :payment_detail => {:payment_type_id => @payment_type.id}
	    response.should redirect_to("/orders/#{@order.id}/summary")
	  end
	end

	describe "summary" do
	  it "show order summary" do
	    
	  end
	end
end
