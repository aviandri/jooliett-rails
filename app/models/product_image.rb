class ProductImage < ActiveRecord::Base
	belongs_to :product_color
	mount_uploader :image, ImageUploader

	scope :primaries, -> {where("primary" => true)}


end
