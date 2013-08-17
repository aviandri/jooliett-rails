ProductLoader = 
	loadMoreProduct : (products) ->
		product_container = undefined
		for product, i in products.master_products
			if i % 4 == 0
				product_container = $("<div></div>").attr("class", "row-fluid")			
			product_item_container = $("<div></div>").attr("class", "span3")
			product_div = $("<div></div>").attr("class", "prod side-corner-tag")
			
			if product.available == false
				ribbon_div = $("<p></p>").attr("class", "danger").append("<span></span>").text("Sold Out")
				product_div.append(ribbon_div)
			else if product.status == "last item"
				ribbon_div = $("<p></p>").attr("class", "warn").append("<span></span>").text("Last Item")
				product_div.append(ribbon_div)

			prod_link = $("<a></a>").attr("href","/products/#{product.id}")
			prod_image = $("<img></img>").attr("src", product.images.full)
			prod_link.append(prod_image)

			prod_meta_div = $("<div></div>").attr("class", "prod-meta")
			prod_meta_div.append($("<span></span>")
							.attr("class", "prod-title").text(product.name)
			
			prod_price_meta = $("<p></p>").attr("class", "prod-price-meta"))			
			

			if product.discount_price != ""				
				prod_price_meta.append($("<span></span>")
							.attr("class", "discount-prod-price").text("IDR #{product.discount_price}"))
				prod_price_meta.append($("<span></span>")
							.attr("class", "prod-price").text(" IDR #{product.price}"))			
			else 
				prod_price_meta.append($("<span></span>")
							.attr("class", "discount-prod-price").text("IDR #{product.price}"))			

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
				ProductLoader.loadMoreProduct(response)
				if response.master_products.length == 0			
					$("#more-button").remove()
				else
					$(".more").find("button").attr("data-page", response.page)						
					$("#more-button").prop("disabled", false);	
					$("#more-button").text("See More")
				$("#more-button").removeAttr("data-status");				
				
			$("#more-button").prop("disabled", true);	
			status = $("#more-button").attr("data-status")
			unless status == "loading"
				$.get "/api/products?page=#{page}&category_name=#{category}", callback, 'json'
			$("#more-button").attr("data-status", "loading");				
			$("#more-button").text("Loading..")		
