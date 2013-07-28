class PaymentType < ActiveRecord::Base
	def full_description
		"#{name} #{description} #{description2}"
	end
end
