class ShippingDetail < ActiveRecord::Base
	validates :name, :country, :address1, :city, :postal_code, :mobile, :presence => true
	validates_format_of :mobile, with: /\A(\+)[\d-]+\z/
	validates_format_of :postal_code, with: /\A[\d]+\z/
end
