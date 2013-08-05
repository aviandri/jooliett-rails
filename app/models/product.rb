class Product < ActiveRecord::Base
	belongs_to :master_product
	belongs_to :product_color
	belongs_to :product_size

	delegate :name, :to => :master_product
	delegate :price, :to => :master_product
	delegate :discount_price, :to => :master_product	
	delegate :discount_percentage, :to => :master_product
	delegate :sales_price, :to => :master_product

	delegate :price_string, :to => :master_product
	delegate :discount_price_string, :to => :master_product
	delegate :sales_price_string, :to => :master_product

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
	 	if available_quantity > 0
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

	 def available_quantity
	 	reserved_order_quantity = Product.reserved_by_order(self.id)
	 	cart_product_quantity = Cart.reserved_product_quantity(self.id)
	 	reserved_product_quantity = reserved_order_quantity + cart_product_quantity
	 	unless quantity.blank?
	 		available_quantity = quantity - reserved_product_quantity
	 		if available_quantity < 0
	 			available_quantity = 0
	 		end
	 	else
	 		available_quantity = 0
	 	end
	 	available_quantity
	 end

	 def self.reserved_by_order(product_id)
	 	product = Product.find product_id
	 	order_items  = OrderItem.joins(:order).where(:orders => {:status => ["pending", "completed"]}, :product_id => product.id)
	 	if order_items.blank?
	 		0
	 	else
	 		order_items.sum(:quantity)
	 	end	 	
	 end

	 def self.reserved_by_cart(product_id)
	 	product = Product.find product_id
	 	Cart.reserved_product_quantity(product.id)
	 end

end
