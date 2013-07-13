class MasterProduct < ActiveRecord::Base
	has_and_belongs_to_many :categories
	has_many :colors, through: :product_colors
	has_many :product_colors

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

	def primary_product_color
		if product_colors.primaries.blank?
			if product_colors.blank?
				nil
			else
				product_colors.first
			end
		else
			product_colors.primaries.first
		end

	end

end
