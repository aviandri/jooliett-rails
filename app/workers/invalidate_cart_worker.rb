class InvalidateCartWorker
  include Sidekiq::Worker
  
  def perform(cart_id)
  	cart = Cart.find(cart_id)
  	cart.invalidate_cart
  end
end