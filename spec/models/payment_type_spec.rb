require 'spec_helper'

describe PaymentType do
  
  describe "full description " do
  	before(:each) do
  	  	@payment_type = FactoryGirl.create(:payment_type, :description => "No rekening 123323232323", :description2 => "KCP Waltermangun", :name => "BCA")
  	end
    it "have full description" do
      	@payment_type.full_description.should eq("#{@payment_type.name} #{@payment_type.description} #{@payment_type.description2}")
    end
  end



end
