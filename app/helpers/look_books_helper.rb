module LookBooksHelper

	def active_item(index)
		if index == 0
			"active"
		end
	end

	def more_look_book_positioning(index)
		if index.odd?
			"pull-left"
		else
			"pull-right"
		end

	end

end
