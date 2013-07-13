require 'spec_helper'

describe ProductImage do

  before(:each) do
	@product_image = FactoryGirl.create(:product_image)		
  end
  
  describe "create" do
  	before do
  		@product_image_create = ProductImage.new
  	end
    it "should be valid" do
    	@product_image_create.primary.should be_nil    
    end

    it "should belong to product color" do
    	@product_image_create.product_color
    end

  end

  describe "image" do
    it "should have medium image" do
    	p @product_image.image.medium
      	@product_image.image.medium.should_not be_nil
    end
  end

  describe "primary product images" do
    it "should return primary product images" do
      	ProductImage.primaries.should_not be_nil
    end
  end
end
