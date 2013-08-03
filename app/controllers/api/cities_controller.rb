class Api::CitiesController < ApplicationController
	respond_to :json

	def index
		state = State.find(params[:state_id])
		@cities = state.cities
	end
end
