class MasterProduct < ActiveRecord::Base
	has_and_belongs_to_many :categories
	validates :name, :description, :price, :presence => true
	has_many :products
	mount_uploader :image, ImageUploader

	def self.find_by_category_name(category_name) 
		category = Category.find_by_name(category_name)	
		if category
			category.master_products
		else
			[]
		end
	end

	def primary_product
		if products.primaries.blank?
			if products.blank?
				nil
			else
				products.first
			end						
		else
			products.primaries.first
		end
	end

	def product_colors 
	end

end
