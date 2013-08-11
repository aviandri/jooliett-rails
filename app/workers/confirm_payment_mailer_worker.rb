class ConfirmPaymentMailerWorker
  include Sidekiq::Worker
  
  def perform(confirmatation_id)
  	confirmation = Confirmation.find confirmatation_id
  	JooliettMailer.confirm_order(confirmation).deliver!
  	JooliettMailer.confirm_order_admin(confirmation).deliver!
  end
end