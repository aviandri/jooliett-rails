class Api::ProductsController < ApplicationController
	respond_to :json

	def index
		@category = Category.find_by_name(params[:category_name])
  		master_products = MasterProduct.find_by_category_name(params[:category_name])
  		if master_products.empty?
  			@master_products = []
  		else
  			@master_products = master_products.page(params[:page]).per(4)
  		end
      
      if params[:page]
        if params[:page].to_i > @master_products.num_pages
          @page = @master_products.num_pages
        else
          @page = params[:page]
        end
        
      else
        @page = 1
      end
	end	

end
