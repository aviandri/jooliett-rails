class CartsController < ApplicationController
  def show
	  @cart = Cart.find(params[:id])  
  end

  def update  	
  	@cart = Cart.find(params[:id])
  	@cart.update_attributes(cart_params)
  	if @cart.save
  		redirect_to controller: :orders, action: :new 
  	else
      flash[:errors] = []
      @cart.errors.each do |key, value|
        flash[:errors] << value
      end
  		render :show
  	end
  end

  private 

  def cart_params  	
  	params.require(:cart).permit(:cart_items_attributes => [:id, :quantity])
  end
end
