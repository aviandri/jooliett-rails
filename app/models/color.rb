class Color < ActiveRecord::Base
	validates :name, :hex, :presence => true

	has_many :master_products, through: :product_colors
	has_many :product_colors

end
