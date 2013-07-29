class ProductsController < ApplicationController

  def index
  	@category = Category.find_by_name(params[:category_name])
  	master_products = MasterProduct.find_by_category_name(params[:category_name])
  	if master_products.empty?
  		@master_products = []
  	else
  		@master_products = master_products.page(params[:page]).per(4)
  	end

    if params[:page]
      @page = params[:page]
    else
      @page = 1
    end

  end

  def show
  	@master_product = MasterProduct.find(params[:id])
  end
end
