class CoversController < ApplicationController
	
	def index
		@covers = Cover.active.sort_by_updated_at
	end
end
