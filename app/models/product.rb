class Product < ActiveRecord::Base
	belongs_to :master_product
	delegate :name, :to => :master_product
	mount_uploader :image, ImageUploader

	scope :primaries, -> {where("primary" => true)}

  	def primary?
	  	if primary
	  		true
	  	else
	  		false
	  	end
	 end

end
