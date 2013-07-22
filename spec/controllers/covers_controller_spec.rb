require 'spec_helper'

describe CoversController do

	before(:each) do
	  	@cover1 = FactoryGirl.create(:cover, :status => "active")
	  	@cover2 = FactoryGirl.create(:cover)
	end

	describe "GET 'index'" do		
	  it "should assign active covers" do
	    get "index"
	    assigns(:covers).should_not be_nil
	    assigns(:covers).first.should eq(@cover1)
	  end
	end

end
