class ProductSize < ActiveRecord::Base
	validates :name, :description, :presence => true
	
end
