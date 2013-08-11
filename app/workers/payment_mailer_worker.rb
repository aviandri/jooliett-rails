class PaymentMailerWorker
  include Sidekiq::Worker
  
  def perform(order_id)
  	@order = Order.find(order_id)
  	JooliettMailer.purchase_confirmation(@order).deliver!
  	JooliettMailer.purchase_confirmation_admin(@order).deliver!
  end
end