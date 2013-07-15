class Product < ActiveRecord::Base
	belongs_to :master_product
	belongs_to :product_color
	belongs_to :product_size
	delegate :name, :to => :master_product

	validates :product_color, :product_size, :presence => true

	scope :primaries, -> {where("primary" => true)}

  	def primary?
	  	if primary
	  		true
	  	else
	  		false
	  	end
	 end

	 def available?
	 	order_items = OrderItem.where(product_id: self.id)
	 	order_item_quantity = order_items.sum(:quantity)
	 	if order_item_quantity < quantity
	 		true
	 	else
	 		false
	 	end
	 end

end
