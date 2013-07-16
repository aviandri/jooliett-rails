Product = 
	populateThumb : (thumbImages) ->
		for thumbImage in thumbImages
			link_tag = $("<a></a>")
				.attr("href", "#action")
				.attr("class", "thumb-img")
			link_tag.append($("<img></img>")
				.attr("data-fullimg", thumbImage.full_img)
				.attr("class", "prod-minithumb")
				.attr("src", thumbImage.thumb_img))

			$("ul.prod-minithumb")
				.append($("<li></li>")	
				.append(link_tag))
		
$ -> 
	$(document).on "click", "img.prod-minithumb", ->
		$('#full-img').attr("src", $(this).data("fullimg"))


$ ->
	$("span.color-tag").click ->
		colorId = $(this).data('color-id')
		$("ul.prod-minithumb").empty()
		callback = (response) ->
			productImages = new ProductImages(response.product_images)			
			$('#full-img').attr("src", productImages.getPrimaryImage().full_img)
			Product.populateThumb(productImages.getThumbImages())
		$.get '/api/product_colors/'+colorId, callback, 'json'




class ProductImages
	constructor: (@productImages) ->
		@thumbImages = []
		for productImage in @productImages
			if productImage.primary == true
				@primaryProductImage = productImage			
	getPrimaryImage: ->
		@primaryProductImage
	getThumbImages: ->
		@productImages

