class ShippingDetail < ActiveRecord::Base
	validates :name, :address1, :city, :postal_code, :mobile, :presence => true
	validates_format_of :mobile, with: /\A(\+)*[\d-]+\z/
	validates_format_of :postal_code, with: /\A[\d]+\z/

	belongs_to :user
	belongs_to :city

	def full_address
		"#{address1}, #{address2}"
	end
end
