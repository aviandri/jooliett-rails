JooliettRails::Application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "products/index/:category_name", :controller => :products, :action => :index
  root :to => 'covers#index'
  resources :covers
  resources :products, :only => [:show]
  resources :carts, :only => [:show]  

  namespace :api do
  	resources :product_colors, :only => [:show]
  	resources :carts, :only => [] do
  		collection do 
  			post :add
  		end
  	end
  end

end
