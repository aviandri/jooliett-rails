class PaymentMailerWorker
  include Sidekiq::Worker
  
  def perform(order)
  	JooliettMailer.purchase_confirmation(order).deliver!
  end
end