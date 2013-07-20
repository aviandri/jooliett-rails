class ShippingDetailsController < ApplicationController
	def new
		if current_user.shipping_detail.nil?
			@shipping_detail =  ShippingDetail.new
		else
			@shipping_detail = current_user.shipping_detail
		end			
	end

	def create
		shipping_detail = ShippingDetail.new(shipping_detail_params)
		shipping_detail.user = current_user
		shipping_detail.save
		redirect_to :controller => "payment_details", :action => "new"
	end


	private

	def shipping_detail_params
		params.require(:shipping_detail).permit(:name, :mobile, :address1, :address2, :city, :postal_code)
	end
end
