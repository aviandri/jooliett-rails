class Api::ProductColorsController < ApplicationController
	respond_to :json

	def show
		@product_color = ProductColor.find(params[:id])
	end


end
