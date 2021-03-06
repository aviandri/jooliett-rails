require 'spec_helper'
require 'pry'

describe Api::ProductColorsController do
	render_views
	before(:each) do
		@color = FactoryGirl.create(:color)
		@product_image = FactoryGirl.create(:product_image)		
		@product_color = FactoryGirl.create(:product_color, :color => @color, :product_images => [@product_image])
		@master_product = FactoryGirl.create(:master_product, :product_colors => [@product_color])
	end
	
	describe "GET product color by id" do
		  it "return http success and json of product color" do
		  	get "show", :id => @product_color.id, :format => :json
		    expected_response = {:name => @color.name,
		    						:product_images => [:full_img => @product_image.image.url,
		    											:medium_img =>@product_image.image.medium.url,
		    											:thumb_img => @product_image.image.thumb.url,
		    											:primary => false],
		    						 :product_sizes => []}.to_json
			response.body.should == expected_response		    											
		  end
		end	

end
	