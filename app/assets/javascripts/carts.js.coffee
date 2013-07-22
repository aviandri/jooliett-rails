$ -> 
	$("#view-cart").click ->
		cartId = $("div.quickcart").attr("data-cart-id")
		if cartId == ""
			alert("return")
			return
		window.location.href = "/carts/"+cartId;

class Cart
	constructor: (@cartObject) ->
		@cart = @cartObject.cart
	getProductQuantity: ->
		@cart.count
	getCartItems: ->
		@cart.cart_items
