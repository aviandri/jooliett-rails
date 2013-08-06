class PaymentConfirmation < ActiveRecord::Base
	belongs_to :order
	validates :invoice_code, :account_holder, :bank_name, :amount, :account_number, :presence => true
end
