ProductLoader = 
	loadMoreProduct : (products) ->
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
							.attr("class", "discount-prod-price").text("IDR #{product.discount_price}"))

			if product.discount_price != null
				prod_price_meta.append($("<span></span>")
							.attr("class", "prod-price").text(" IDR #{product.price}"))			
			prod_meta_div.append(prod_price_meta)
			product_div.append(prod_link)	
			product_div.append(prod_meta_div)

			product_item_container.append(product_div)	
			product_container.append(product_item_container)
			$("#product-container").append(product_container)


$ ->
	$(window).scroll ->
		if $(window).scrollTop() == $(document).height() - $(window).height()
			page = parseInt($("#more-button").attr("data-page")) + 1	
			category = $("#more-button").attr("data-category")
			callback = (response) ->	
				console.log(response)		
				ProductLoader.loadMoreProduct(response)
				if response.master_products.length == 0			
					$("#more-button").remove()
				else
					$(".more").find("button").attr("data-page", response.page)						
					$("#more-button").prop("disabled", false);	
					$("#more-button").text("See More")
			$("#more-button").prop("disabled", true);	
			$.get "/api/products?page=#{page}&category_name=#{category}", callback, 'json'
			$("#more-button").text("Loading..")		
