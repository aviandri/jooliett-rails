class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_cart

  def current_cart
  	if cookies[:cart_id]
  		cart = Cart.find cookies[:cart_id]
  	else
  		cart = Cart.new
  	end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
  end
end
