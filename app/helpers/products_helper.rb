module ProductsHelper

	def text_color(color)
		if color.text_color.blank?
			""
		else
			color.text_color
		end
	end

	def text_color_style(color)
		if color.text_color.blank?
			""
		else
			"color:"+color.text_color
		end
	end
end
