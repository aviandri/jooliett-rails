$ ->
	$(document).ready ->
      $('.image').hide().fadeIn(100);
 
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

	rePopulateCart : (cartItems) ->
			for cart_item in cartItems
				cart_item_tag = $("<div></div>")
							.attr("class", "qcart-item row")
				cart_item_image_div = $("<div></div>")
										.attr("class", "span1")
				cart_item_image_tag = $("<img></img>")
										.attr("src", cart_item.thumb_img)
				cart_item_image_div.append(cart_item_image_tag)									

				cart_item_detail_div = $("<div></div>")
										.attr("class", "span2 qcart-details")

				cart_item_name_tag = $("<span></span>")										
										.attr("class", "qcart-item-name")
										.text(cart_item.name + "(" + cart_item.quantity + ")")

				cart_item_price_tag = $("<span></span>")									
										.attr("class", "qcart-item-price")
										.text("IDR" + cart_item.price)

				cart_item_detail_div.append(cart_item_name_tag)							
				cart_item_detail_div.append(cart_item_price_tag)

				cart_item_tag.append(cart_item_image_div)
				cart_item_tag.append(cart_item_detail_div)
				
				$("div.quickcart").prepend(cart_item_tag)	

			p_msg = $("<p></p>").attr("class", "msg success").text("Successfully Added to cart")
			$("div.qcart-action").prepend(p_msg)

		
class Cart
	constructor: (@cartObject) ->
		@cart = @cartObject.cart
	getProductQuantity: ->
		@cart.count
	getCartItems: ->
		@cart.cart_items

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

		
$ -> 
	$(document).on "click", "img.prod-minithumb", ->
		$('#full-img').attr("src", $(this).data("fullimg"))


$ ->
	$(document).on "click", "span.color-tag", ->
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
			cart = new Cart(response)
			$("span.qcart-count").text(""+cart.getProductQuantity())
			$('div').remove('.qcart-item');
			Product.rePopulateCart(cart.getCartItems())			
			$("#fat-menu").addClass("open")


		colorId = $("div.color-tag").data("color-id")
		productSizeId = $("div.size-tag").attr('data-size-id')
		if productSizeId == ''
			alert("Please Choose Product Size")
		else
			json = {'product_color_id' : colorId, 'product_size_id' : productSizeId}		
			$.ajax '/api/carts/add', type: 'POST', data: JSON.stringify(json), success: callback, contentType: "application/json", dataType: "json"		
		
		


