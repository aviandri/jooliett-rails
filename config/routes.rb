JooliettRails::Application.routes.draw do
  root :to => 'covers#index'
  devise_for :users, :controllers => { :registrations => "users" }  
  
  resources :users
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  ActiveAdmin.routes(self)
  
  resources :covers
  
  resources :products, :only => [:show] do
    collection do
       get '/category/:category_name' => 'products#index'
    end
  end
  resources :carts, :only => [:show, :update]
  
  resources :cart_items, :only => [:destroy]

  resources :orders do
    resources :shipping_details
    resources :payment_details
    member do
      get :summary
      patch :complete
    end
  end

  resources :look_books

  namespace :api do
  	resources :product_colors, :only => [:show]
  	resources :carts, :only => [] do
  		collection do 
  			post :add
  		end
  	end
    resources :products, :only => [:index]
  end
end
