class Category < ActiveRecord::Base
	has_and_belongs_to_many :master_products

	validates :name, :presence => true, :uniqueness => true

	def self.categories_except_new_arrival
		new_arrival = Category.where(name: "new-arrival")
		unless new_arrival.blank?
			arel_table = Arel::Table.new(:categories)
			categories = Category.where(arel_table[:id].not_in new_arrival.first.id).order(:name)
		else
			categories = []
		end
		categories
	end
end
