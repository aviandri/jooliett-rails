class CartQuantityValidator  < ActiveModel::Validator
	def validate(record)
		record.product.available_quantity < record.quantity
		record.errors[:product] << 'Insufficient product quantity'
	end
end

class CartItem < ActiveRecord::Base
	include ActiveModel::Validations
	belongs_to :product
	belongs_to :cart
	before_save :init_default_value	
	# validates_with CartQuantityValidator

	def sub_total
		product.sales_price * quantity
	end
	def sub_total_string
		stringify_price(sub_total)
	end

	private 
	def init_default_value
		self.quantity = 1 if self.quantity.nil?
	end

	private
	def stringify_price(number)
		number.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1.').reverse
	end




end
