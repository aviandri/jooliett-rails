json.cities do
	json.array! @cities do |city|
		json.id city.id
		json.name city.name
		json.delivery_cost city.delivery_cost
	end
end