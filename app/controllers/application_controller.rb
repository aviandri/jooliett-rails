class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_cart

  def current_cart
  	if cookies[:cart_id]
  		cart = Cart.find cookies[:cart_id]
  	else
  		cart = Cart.new
  	end
  end
end
