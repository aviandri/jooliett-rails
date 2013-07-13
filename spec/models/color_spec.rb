require 'spec_helper'

describe Color do
	let(:valid_color){Color.new(:name => "blue", :hex => "#0000")}
	let(:not_valid_color){Color.new}
	before(:each) do
		
	end

	describe "create" do
		it "should be valid" do
			valid_color.should be_valid
		end
		it "should not be valid" do
			not_valid_color.should_not be_valid
		end		
	end

	describe "product color" do
		it "should have product colors" do
			valid_color.product_colors.should_not be_nil 
		end
	end

	describe "master products" do
		it "should have master products" do
			valid_color.master_products.should_not be_nil
		end
	end


end