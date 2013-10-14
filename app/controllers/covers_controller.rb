class CoversController < ApplicationController
	
	def index
		@covers = Cover.sort_by_updated_at.active
	end
end
	