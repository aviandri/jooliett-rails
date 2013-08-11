class Confirmation < ActiveRecord::Base
	after_create :send_email
	belongs_to :order
	validates :order_id, :jne_code, :presence => true

	def send_email
		ConfirmPaymentMailerWorker.perform_async(self.id)
	end
end
