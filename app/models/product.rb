class Product < ActiveRecord::Base
	belongs_to :master_product
	belongs_to :product_color
	belongs_to :product_size

	delegate :name, :to => :master_product
	delegate :price, :to => :master_product
	delegate :discount_price, :to => :master_product	
	delegate :discount_percentage, :to => :master_product
	delegate :sales_price, :to => :master_product

	has_many :cart_items
	has_many :carts, through: :cart_items

	validates :product_color, :product_size, :quantity, :presence => true


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
	 	cart_product_quantity = Cart.reserved_product_quantity(self.id)
	 	reserved_product_quantity = order_item_quantity + cart_product_quantity
	 	if reserved_product_quantity < quantity
	 		true
	 	else
	 		false
	 	end
	 end

	 def self.find_by_product_color_product_size(product_size_id, product_color_id)
	 	products = Product.where(product_color_id: product_color_id, product_size_id: product_size_id)
	 	if products.empty?
	 		nil
	 	else
	 		products.first
	 	end
	 end

	 def full_description
	 	"#{name} - #{product_color.name}/#{product_size.description} "
	 end

end
