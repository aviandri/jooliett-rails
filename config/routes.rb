JooliettRails::Application.routes.draw do
  
  get "products/index/:category_name", :controller => :products, :action => :index
  root :to => 'covers#index'
  resources :covers

end
