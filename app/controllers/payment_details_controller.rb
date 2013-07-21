class PaymentDetailsController < ApplicationController
	before_filter :authenticate_user!

	def new
		@payment_detail =  PaymentDetail.new	
		@payment_types = PaymentType.all
	end

	def create
		payment_detail = PaymentDetail.new(payment_detail_params)
		if payment_detail.save
			redirect_to :controler => :orders, :action => :new
		else
			render :new
		end

	end

	private 

	def payment_detail_params
		params.require(:payment_detail).permit(:payment_type)
	end
end
