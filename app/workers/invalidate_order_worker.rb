class InvalidateOrderWorker
  include Sidekiq::Worker
  
  def perform(order_id)
  	order = Order.find(order_id)
  	order.invalidate_order
  end
end