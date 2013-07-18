require 'spec_helper'

describe User do
 	
 	describe "valid" do
 	  it "should be valid" do
 	    user = User.new(email: "aviandri@gmail.com", password: "password01", password_confirmation: "password01")
 	    user.should be_valid
 	  end
 	end
end
