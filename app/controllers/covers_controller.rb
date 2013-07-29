class CoversController < ApplicationController
	
	def index
		@covers = Cover.active
	end
end
