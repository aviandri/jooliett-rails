$ -> 
	$("#view-cart").click ->
		cartId = $("div.quickcart").attr("data-cart-id")
		if cartId == ""
			alert("return")
			return
		alert("cartId")
		window.location.href = "/carts/"+cartId;

