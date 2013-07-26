$ -> 
	$("#view-cart").click ->
		cartId = $("div.quickcart").attr("data-cart-id")
		if cartId == ""
			return
		window.location.href = "/carts/"+cartId;

