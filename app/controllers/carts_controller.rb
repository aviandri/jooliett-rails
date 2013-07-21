class CartsController < ApplicationController
  def show
	@cart = Cart.find(params[:id])  
  end

  def update  	
  	@cart = Cart.find(params[:id])
  	@cart.update_attributes(cart_params)
  	binding.pry
  	if @cart.save
  		redirect_to :controller => :shipping_details, :new, :order_id => 
  	else
  		render :show
  	end
  end

  private 

  def cart_params  	
  	params.require(:cart).permit(:cart_items_attributes => [:id, :quantity])
  end
end
