require 'spec_helper'

describe UsersController do

	describe "GET 'new' for new users" do
	before(:each) do
		@request.env["devise.mapping"] = Devise.mappings[:user]
	end
	  it "should go to new user" do
	  	# get :new
	  	# assigns(:user).should_not be_nil
	  end
	end

end
