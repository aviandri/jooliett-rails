require 'spec_helper'

describe ShippingDetail do
  
  describe "valid" do
    it "should be valid" do
    	shipping_detail = ShippingDetail.new
		shipping_detail.valid?
		shipping_detail.errors.should include(:name, :mobile, :country, :address1, :city, :postal_code)
    end

    it "should have valid phone" do
    	shipping_detail = ShippingDetail.new
    	shipping_detail.mobile = "safsad"
    	shipping_detail.valid?    	
    	shipping_detail.errors.should include(:mobile)

    	shipping_detail.mobile = "+628211-222"
    	shipping_detail.valid?
    	shipping_detail.errors.should_not include(:mobile)

	end

	it "should have valid phone" do
    	shipping_detail = ShippingDetail.new
    	shipping_detail.postal_code = "safsad"
    	shipping_detail.valid?    	
    	shipping_detail.errors.should include(:postal_code)
	end
  end

  describe "user" do
    it "should belong_to user" do
      	shipping_detail = ShippingDetail.new
      	shipping_detail.user.should be_nil
    end
  end
end
