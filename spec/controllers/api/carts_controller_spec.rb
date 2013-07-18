require 'spec_helper'

describe Api::CartsController do
	render_views
	before(:each) do
		@product_size = FactoryGirl.create(:product_size)
		@product_image = FactoryGirl.create(:product_image)
		@product_color = FactoryGirl.create(:product_color, :product_images => [@product_image])
		@master_product = FactoryGirl.create(:master_product)
		@product = FactoryGirl.create(:product, :master_product => @master_product, :product_color => @product_color, :product_size => @product_size)
	end

	describe "Add cart item" do
	  it "return http success and respond with cart with products" do
	  	post "add", :product_color_id => @product_color.id, :product_size_id => @product_color.id, :format => :json
		response.body.should include(@master_product.name)	  	
		response.body.should include(@master_product.price.to_s)
		response.body.should include(@product_image.image.thumb.url)	  	
	  end
	end
end
