require 'spec_helper'
require 'pry'

describe CartItemsController do

  describe "GET 'destroy'" do
  	before(:each) do
  		@product = FactoryGirl.create(:product)
  		@cart = FactoryGirl.create(:cart, products: [@product])
  	end
    it "returns http success" do
      delete 'destroy', id: @cart.cart_items.first.id, cart_id: @cart.id
      redirect_to :controller => :carts, :action => :show, :id => @cart.id
    end
  end

end
