class CartQuantityValidator < ActiveModel::EachValidator
	def validate(record)
		record.product.available_quantity < record.quantity
		record.errors[:product] << 'Insufficient product quantity'
	end
end