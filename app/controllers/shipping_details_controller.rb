class ShippingDetailsController < ApplicationController
	before_filter :authenticate_user!
	def new	
		@order = Order.find(params[:order_id])
		@shipping_detail =  ShippingDetail.new
	end

	def create
		@order = Order.find(params[:order_id])
		@shipping_detail = ShippingDetail.new(shipping_detail_params)
		@order.shipping_detail = @shipping_detail
		if @order.save			
			redirect_to :controller => "payment_details", :action => "new"
		else
			render :new
		end
	end
	private

	def shipping_detail_params
		params.require(:shipping_detail).permit(:name, :mobile, :address1, :address2, :city, :postal_code)
	end
end
