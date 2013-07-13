require 'spec_helper'

describe ProductColor do

	let(:valid_product_color){ProductColor.new(:color => Factory.create(:color), :master_product => Factory.create(:master_product))}
	before(:each) do
		@product_color = ProductColor.new(:color => Color.new, :master_product => MasterProduct.new)
	end

	describe "create" do
		it "should be valid" do			
		end
	end

	describe "primaries" do
	  it "should have primaries scope" do	  	
	    ProductColor.primaries.should_not be_nil
	  end
	  it "should return a list of primary product colors" do
	  	product_color_primary = FactoryGirl.create(:product_color, :primary => true)
	  	ProductColor.primaries.should include(product_color_primary)
	  end
	end

	describe "primary" do
	  it "should have primary flag" do
	    @product_color.primary.should be_nil
	  end
	end

	describe "product images" do
		before do
			@product_image_primary = FactoryGirl.create(:product_image, :primary => true)
			@product_color_with_image = FactoryGirl.create(:product_color, :product_images => [@product_image_primary])

			@product_image_not_primary = FactoryGirl.create(:product_image)
			@product_color_not_primary_image = FactoryGirl.create(:product_color, :product_images => [@product_image_not_primary])
		end
		it "return empty primary image" do
			@product_color.product_images.should_not be_nil
		end

		it "should return a list of primary image" do
			@product_color_with_image.product_images.should include(@product_image_primary)
		end
		it "should return primary product image" do
			@product_color_with_image.primary_image.should eq(@product_image_primary)
	  	end

	  	it "should return first product image if no primary" do
			@product_color_not_primary_image.primary_image.should eq(@product_image_not_primary)
	  	end

	  	it "should return nil if product images is empty" do
	  		product_color = FactoryGirl.create(:product_color)
	  		product_color.primary_image.should be_nil
	  	end
	end	
	
end