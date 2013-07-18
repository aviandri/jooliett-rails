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
		$("div.color-tag").attr("data-color-id", colorId)
		console.log($("div.color-tag").data("color-id"))
		callback = (response) ->
			productImages = new ProductImages(response.product_images)			
			$('#full-img').attr("src", productImages.getPrimaryImage().full_img)
			Product.populateThumb(productImages.getThumbImages())
		$.get '/api/product_colors/'+colorId, callback, 'json'


$ ->
	$("span.size-tag").click ->
		productColorId = $(this).data('size-id')
		$("div.size-tag").attr("data-size-id", productColorId)


$ ->
	$("button.addcart").click ->
		callback = (response) ->
			console.log(response)
		colorId = $("div.color-tag").data("color-id")
		productSizeId = $("div.size-tag").attr('data-size-id')
		console.log(productSizeId)
		if productSizeId == ''
			alert("Please Choose Product Size")
		else
			json = {'product_color_id' : colorId, 'product_size_id' : productSizeId}		
			$.ajax '/api/carts/add', type: 'POST', data: JSON.stringify(json), success: callback, contentType: "application/json", dataType: "json"		
		
		
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

