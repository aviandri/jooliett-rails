class ProductColor < ActiveRecord::Base
	belongs_to :color
	belongs_to :master_product
	scope :primaries, -> {where("primary" => true)}

	has_many :product_images

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

end
