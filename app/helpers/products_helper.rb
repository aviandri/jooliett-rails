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

	def ribbon_tag(master_product)
		if not master_product.available?
			"<p class='danger'><span>Sold Out</span></p>".html_safe
		elsif master_product.status == "last item"
			"<p class='warn'><span>Last Item</span></p>".html_safe
		end

	end
end
