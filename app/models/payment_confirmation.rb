class PaymentConfirmation < ActiveRecord::Base
	validates :invoice_code, :account_holder, :bank_name, :amount, :presence => true
end
