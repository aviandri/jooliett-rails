class ProductColor < ActiveRecord::Base
	belongs_to :color
	belongs_to :master_product
	scope :primaries, -> {where("primary" => true)}
	delegate :name, :to => :color
	delegate :hex, :to => :color

	validates :color, :master_product, :presence => true

	has_many :product_images
	accepts_nested_attributes_for :product_images

	def primary_image
		if product_images.primaries.blank?
			if product_images.blank?
				nil
			else
				product_images.first
			end
		else
			product_images.primaries.first
		end
	end

	def products
		Product.where(product_color_id: self.id, master_product_id: master_product.id)
	end

	def available?
		products = self.products
		flag = false
		products.each do |product|
			if product.available?
				flag = true
			end
		end
		flag
	end
end
