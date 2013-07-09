class MasterProduct < ActiveRecord::Base
	has_and_belongs_to_many :categories


	validates :name, :description, :price, :presence => true


	def self.find_by_category_name(category_name) 
		category = Category.find_by_name(category_name)	
		if category
			category.master_products
		else
			[]
		end
	end

end
