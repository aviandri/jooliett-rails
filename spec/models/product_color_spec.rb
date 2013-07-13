require 'spec_helper'

describe ProductColor do

	let(:valid_product_color){ProductColor.new(:color => Factory.create(:color), :master_product => Factory.create(:master_product), :image => "")}
	before(:each) do
		@product_color = ProductColor.new(:color => Color.new, :image => "", :master_product => MasterProduct.new)
	end

	describe "create" do
		it "should be valid" do
		end

	end

end