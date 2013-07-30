class MasterProduct < ActiveRecord::Base
	has_and_belongs_to_many :categories
	has_many :colors, through: :product_colors
	has_many :product_colors
	has_and_belongs_to_many :product_sizes

	accepts_nested_attributes_for :product_colors

	validates :name, :description, :price, :presence => true
	has_many :products


	def price_string
		stringify_price(price)
	end

	def discount_price_string
		stringify_price(discount_price)
	end

	def sales_price_string
		stringify_price(sales_price)
	end

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

	def self.suggestions
		MasterProduct.all.sample(4)
	end

	def sales_price
		if self.discount_price.nil?
			self.price
		else
			self.discount_price
		end
	end

	def available?
		flag = false
		product_colors.each do |product_color|	
			if product_color.available?
				flag = true
			end
		end
		flag
	end

	private

	def stringify_price(number)
		number.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1.').reverse
	end
end
