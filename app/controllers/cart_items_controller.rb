class CartItemsController < ApplicationController
  
  def destroy
  	cart_item = CartItem.find(params[:id])
  	cart_item.destroy  	
  	redirect_to :controller=> :carts, :action => :show, :id => params[:cart_id]
  end
end
