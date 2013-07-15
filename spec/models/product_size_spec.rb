require 'spec_helper'

describe ProductSize do
 	
 	describe "create" do
 	  it "shold be valid" do
 	  	FactoryGirl.create(:product_size).should be_valid
 	  end
 	end
 	
end
