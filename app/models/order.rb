class Order < ActiveRecord::Base
	belongs_to :shipping_detail, dependent: :destroy, :autosave => true
	belongs_to :payment_detail, dependent: :destroy, :autosave => true
	belongs_to :user

	has_many :order_items, dependent: :destroy, :autosave => true


	def generate_total_price
		unless self.order_items.empty?
			self.order_items.each do |order_item|
				if self.total_price.nil?
					self.total_price = 0
				end
				self.total_price = self.total_price + (order_item.product.sales_price * order_item.quantity)
			end	
			self.total_price = self.total_price + self.payment_detail.pay_code
			self.total_price = self.total_price + self.shipping_detail.price	
		end				
	end

	def total_price_string
		stringify_price(total_price)
	end

	def total_price_clean
		
	end

	def prepare_order_summary
		payment_detail.generate_payment_code
		generate_total_price
	end

	private
	def stringify_price(number)
		number.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1.').reverse
	end

end
