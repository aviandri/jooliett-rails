class Category < ActiveRecord::Base	
	has_and_belongs_to_many :master_products
	validates :name, :presence => true, :uniqueness => true

	scope :by_type, -> {where(type: "Type")}
	scope :by_event, -> {where(type: "Event")}

	Types = %w{Event, Type}

	Types.each do |type|
		type_down = type.downcase
		define_method "is_#{type_down}?" do
			self.type == type
		end
	end

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

class Event < Category

end

class Type < Category
	def self.all_name_execept_new_arrival
		types = self.all.collect(&:name)
		types.reject!{|x| x == "new-arrival"}
	end

end
