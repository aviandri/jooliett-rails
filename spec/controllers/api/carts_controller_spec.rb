require 'spec_helper'
require 'pry'

describe Api::CartsController do
	render_views
	before(:each) do
		@product_size = FactoryGirl.create(:product_size)
		@product_image = FactoryGirl.create(:product_image)
		@product_color = FactoryGirl.create(:product_color, :product_images => [@product_image])
		@master_product = FactoryGirl.create(:master_product)
		@product = FactoryGirl.create(:product, :master_product => @master_product, :product_color => @product_color, :product_size => @product_size, :quantity  => 2)
	end

	describe "Add cart item" do
	  it "return http success and respond with cart with products" do
	  	post "add", :product_color_id => @product_color.id, :product_size_id => @product_size.id, :format => :json
		response.body.should include(@master_product.name)	  	
		response.body.should include(@master_product.price.to_s)
		response.body.should include(@product_image.image.thumb.url)	  	
	  end

	  it "should contain unique product in cart" do
	  	@cart = FactoryGirl.create(:cart)
	  	@cart_item = FactoryGirl.create(:cart_item, :cart_id => @cart.id, :product_id => @product.id)
	  	cookies[:cart_id] = @cart

	  	post "add", :product_color_id => @product_color.id, :product_size_id => @product_size.id, :format => :json
		cart = Cart.find(@cart.id)
		cart.cart_items.count.should eq(1)
		cart.products.count.should eq(1)
		cart.cart_items.first.quantity.should eq(2)
		response.body.should include(@master_product.name)	  	
		response.body.should include(@master_product.price.to_s)
		response.body.should include(@product_image.image.thumb.url)	  	
	  end
	end

	it "should return throw error if product not available" do
		product_size = FactoryGirl.create(:product_size)
		product_image = FactoryGirl.create(:product_image)
		product_color = FactoryGirl.create(:product_color, :product_images => [product_image])
		master_product = FactoryGirl.create(:master_product)
		product = FactoryGirl.create(:product, :master_product => master_product, :product_color => product_color, :product_size => product_size, :quantity  => 1)

	  	FactoryGirl.create(:order_item, :product => product)
		post "add", :product_color_id => product_color.id, :product_size_id => product_size.id, :format => :json
		response.body.should include("error")
	end
 	
	  

end
