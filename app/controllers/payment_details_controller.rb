class PaymentDetailsController < ApplicationController
	before_filter :authenticate_user!

	def new
		@order = Order.find(params[:order_id])
		@payment_detail =  PaymentDetail.new	
		@payment_types = PaymentType.all
	end

	def create
		@order = Order.find(params[:order_id])
		payment_detail = PaymentDetail.new(payment_detail_params)
		@order.payment_detail = payment_detail
		@order.prepare_order_summary
		if @order.save
			redirect_to summary_order_path(:id => @order.id)
		else
			render :new
		end

	end

	private 

	def payment_detail_params
		params.require(:payment_detail).permit(:payment_type_id)
	end
end