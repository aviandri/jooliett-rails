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

end