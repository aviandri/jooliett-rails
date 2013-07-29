class PaymentConfirmationsController < ApplicationController
	def show
		@order = Order.where(:invoice_code => params[:invoice_code]).first
		@payment_confirmation = PaymentConfirmation.new
	end

	def create
		@payment_confirmation = PaymentConfirmation.create(payment_confirmation_param)
	end

	private 

	def payment_confirmation_param
		params.require(:payment_confirmation).permit(:invoice_code, :account_holder, :bank_name, :amount)
	end

end
