class PaymentConfirmation < ActiveRecord::Base
	belongs_to :order
	validates :invoice_code, :account_holder, :bank_name, :amount, :presence => true
end
