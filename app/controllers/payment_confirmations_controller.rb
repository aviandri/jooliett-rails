class PaymentConfirmationsController < ApplicationController
	def show
		@order = Order.where(:invoice_code => params[:invoice_code]).first
		@payment_confirmation = PaymentConfirmation.new
	end

	def create		
		@payment_confirmation = PaymentConfirmation.create(payment_confirmation_param)
		order = Order.find_by_invoice_code(@payment_confirmation.invoice_code)
		order.status = "confirmed"
		order.save
		@payment_confirmation.order = order
		unless @payment_confirmation.save
			flash[:errors] = []      		
        	flash[:errors] << "Please Fill In All the fields"
      		redirect_to :action => "show", :invoice_code => @payment_confirmation.invoice_code
		end
	end

	private 

	def payment_confirmation_param
		params.require(:payment_confirmation).permit(:invoice_code, :account_holder, :bank_name, :amount, :account_number)
	end

end
