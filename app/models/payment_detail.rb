class PaymentDetail < ActiveRecord::Base
	belongs_to :payment_type
	belongs_to :payment_code

	def pay_code
		unless self.payment_code.nil?
			self.payment_code.id % 200
		end
	end

	def generate_payment_code
		self.payment_code = PaymentCode.create
	end
end
