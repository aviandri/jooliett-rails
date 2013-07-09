class Product < ActiveRecord::Base
	belongs_to :master_product
	delegate :name, :to => :master_product



end
