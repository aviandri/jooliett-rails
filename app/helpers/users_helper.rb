module UsersHelper

	def error_flag(user, field)
		"error" unless user.errors[field.to_sym].empty? 
	end

	def error_message(user, field)
		user.errors.messages[field.to_sym].first unless user.errors[field.to_sym].empty?
	end
end
