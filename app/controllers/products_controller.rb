class ProductsController < ApplicationController

  def index
  	@category = Category.find_by_name(params[:category_name])
  	@master_products = MasterProduct.find_by_category_name(params[:category_name]).order("created_at DESC").page(params[:page]).per(4)  	
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
