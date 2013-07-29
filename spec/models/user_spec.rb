require 'spec_helper'

describe User do
 	
 	describe "valid" do
 	  it "should be valid" do
 	    user = User.new(email: "aviandri@gmail.com", password: "password01", password_confirmation: "password01", :name => "name")
 	    user.should be_valid
 	  end

 	  it "should not be valid" do
 	  	user = User.new
 	  	user.valid?
 	  	user.errors.messages.should include(:name, :password, :email)    
 	  end
 	end 	
end
