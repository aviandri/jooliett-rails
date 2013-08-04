$ ->
	$(document).ready ->	   
      $('.image').hide().fadeIn(300);
 
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
										.text("IDR" + cart_item.price_string)

				cart_item_detail_div.append(cart_item_name_tag)							
				cart_item_detail_div.append(cart_item_price_tag)

				cart_item_tag.append(cart_item_image_div)
				cart_item_tag.append(cart_item_detail_div)
				
				$("div.quickcart").prepend(cart_item_tag)	

			p_msg = $("<p></p>").attr("class", "msg success").text("Successfully Added to cart")
			$("div.qcart-action").prepend(p_msg)

	loadMoreProducts : (products) ->
		product_container = undefined
		for product, i in products.master_products
			if i % 4 == 0
				product_container = $("<div></div>").attr("class", "row-fluid")			
			product_item_container = $("<div></div>").attr("class", "span3")
			product_div = $("<div></div>").attr("class", "prod")
			
			prod_link = $("<a></a>").attr("href","/products/#{product.id}")
			prod_image = $("<img></img>").attr("src", product.images.medium)
			prod_link.append(prod_image)

			prod_meta_div = $("<div></div>").attr("class", "prod-meta")
			prod_meta_div.append($("<span></span>")
							.attr("class", "prod-title").text(product.name)
			
			prod_price_meta = $("<p></p>").attr("class", "prod-price-meta"))			

			prod_price_meta.append($("<span></span>")
							.attr("class", "discount-prod-price").text("IDR #{product.price}"))

			if product.discount_price != null
				prod_price_meta.append($("<span></span>")
							.attr("class", "prod-price").text(" IDR #{product.discount_price}"))			
			prod_meta_div.append(prod_price_meta)
			product_div.append(prod_link)	
			product_div.append(prod_meta_div)

			product_item_container.append(product_div)	
			product_container.append(product_item_container)
			$("#product-container").append(product_container)

		

	repopulateSizes: (sizes) ->
		console.log(sizes)
		container_div = $("div.size-tag")
		for product_size in sizes
			if product_size.available == true
				span_tag = $("<span></span>")
							.attr("class","size-tag")
							.attr("data-size-id", product_size.id)							
				link_tag = $("<a></a>").attr("href","#action").text(product_size.name)
				span_tag.append(link_tag)
				container_div.append(span_tag)

	inverseColorSpan:(span) ->
		$("span.color-tag").each ->
			realColor = $(this).attr("data-color-hex")
			console.log(realColor)
			$(this).find("a").css("background-color", realColor)
			$(this).find("a").css("color", "#FFFFFF")
		currentColor = span.find("a").css("background-color")
		console.log(span.find("a").css("color"))
		span.find("a").css("color", currentColor)
		span.find("a").css("background-color", "#333")

	showStatusBar:(sevirity, text) ->
		container = $("<div></div>").attr("class", "container")
		content = $("<div></div>").attr("class", "content")
		span_text = $("<span></span>").text(text)
		anchor = $("<a></a>").attr("href","#").attr("class", "close").attr("data-dismiss","alert").text("&times;")		
		content.append(span_text)
		content.append(anchor)
		container.append(content)
		$(".statusbar").append(container)
		$(".statusbar").addClass(sevirity)

		
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
		$('#full-img').attr("data-zoom-zoom", $(this).data("fullimg"))
		fullImage = $(this).data("fullimg")
		$('.zoomLens img').attr('src', fullImage)				
		$('div.zoomWindow').css("background-image", "url(#{fullImage})")


$ ->
	$(document).on "click", "span.color-tag", ->
		colorId = $(this).data('color-id')
		$("ul.prod-minithumb").empty()
		$("div.color-tag").attr("data-color-id", colorId)		
		callback = (response) ->
			productImages = new ProductImages(response.product_images)			
			$('#full-img').attr("src", productImages.getPrimaryImage().full_img)
			$('.zoomLens img').attr('src', productImages.getPrimaryImage().full_img)		
			$('div.zoomWindow').css("background-image", "url(#{productImages.getPrimaryImage().full_img})")
			Product.populateThumb(productImages.getThumbImages())
			$("div.size-tag").empty()
			Product.repopulateSizes(response.product_sizes)
		$.get '/api/product_colors/'+colorId, callback, 'json'		
		Product.inverseColorSpan($(this))

		


$ ->
	$(document).on "click", "span.size-tag", ->
		productColorId = $(this).data('size-id')
		$("span.size-tag.selected").removeClass("selected")
		$(this).addClass("selected")
		$("div.size-tag").attr("data-size-id", productColorId)

$ ->
	$(document).on "click", ".addcart", ->
		callback = (response) ->
			cart = new Cart(response)
			$("span.qcart-count").text(""+cart.getProductQuantity())
			$('div').remove('.qcart-item');
			$('.msg').remove();
			Product.rePopulateCart(cart.getCartItems())			
			$("#fat-menu").addClass("open")
			$("#not-available").hide()
			console.log("button")
			console.log($("#view-cart").length)
			if $("#view-cart").length == 0
				button = $("<button></button>").attr("id", "view-cart")
					.attr("class", "btnflat-fluid action")
					.text("Checkout")
				$("div.qcart-action").append(button)	
		colorId = $("div.color-tag").data("color-id")
		productSizeId = $("div.size-tag").attr('data-size-id')
		if productSizeId == ''
			alert("Please Choose Product Size")
		else
			json = {'product_color_id' : colorId, 'product_size_id' : productSizeId}		
			$.ajax '/api/carts/add', type: 'POST', data: JSON.stringify(json), success: callback, contentType: "application/json", dataType: "json"		

		

$ -> 
	$(document).on "click", "#more-button", ->
		page = parseInt($(this).attr("data-page")) + 1	
		category = $(this).attr("data-category")
		callback = (response) ->	
			console.log(response)		
			Product.loadMoreProducts(response)
			if response.master_products.length == 0			
				$("#more-button").remove()
			else
				$(".more").find("button").attr("data-page", response.page)						
				$("#more-button").prop("disabled", false);	
				$("#more-button").text("See More")
		$(this).prop("disabled", true);	
		$.get "/api/products?page=#{page}&category_name=#{category}", callback, 'json'
		$("#more-button").text("Loading..")

$ ->
	$("#full-img").elevateZoom({borderSize:0,tint:true, tintColour:'#F90', tintOpacity:0, tintColour:"black";});


