class ProductColor < ActiveRecord::Base
	belongs_to :color
	belongs_to :master_product

	scope :primaries, -> {where("primary" => true)}

	

end
