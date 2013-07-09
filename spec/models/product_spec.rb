require 'spec_helper'

describe Product do

  before(:each) do
  		@product = FactoryGirl.create(:product)
  end
  
  describe "should be valid" do
    it "contain name" do
    	@product.name.should eq "Dress"      
    end
  end  
  
end