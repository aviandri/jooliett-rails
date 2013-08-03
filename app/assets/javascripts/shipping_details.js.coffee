$ ->
	$("#states").change ->
		callback = (response) ->
			console.log(response)
			$("#shipping_detail_city_id option").remove()
			for city in response.cities				
				option = $("<option></option>").attr("value", city.id).text(city.name)
				console.log(option)
				$("#shipping_detail_city_id").append(option)
		stateId = $(this).val()
		$.get "/api/cities.json?state_id=#{stateId}", callback, 'json'		