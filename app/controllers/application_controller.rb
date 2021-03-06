class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_cart, :category_items

  def current_cart
    	unless cookies[:cart_id].blank?
    		cart = Cart.find cookies[:cart_id]
        if cart.blank?
          cart = Cart.new
        else
          if cart.status == "canceled"
            cart = Cart.new
          end
        end
    	else
    		cart = Cart.new
    	end
      cart
  end

  def category_items
      Category.categories_except_new_arrival
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
  end

end
