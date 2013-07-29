class InvalidateCartWorker
  include Sidekiq::Worker
  
  def perform(cart_id)
  	cart = Cart.find(cart_id)
  	cart.status = "canceled"
  	cart.save    
  end
end