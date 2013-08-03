class City < ActiveRecord::Base
	belongs_to :state


	def delivery_cost_string
		stringify_price(delivery_cost)
	end
	private

	def stringify_price(number)
  		number.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1.').reverse
  	end
end
