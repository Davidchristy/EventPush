	$(document).on("pageload", function() {

			var latitude = position.coords.latitude;
			var longitude = position.coords.longitude;
			// var latlon = position.coords.latitude + "," +
			// position.coords.longitude;
			console.log("Latitude: " + latitude);
			console.log("Longitude: " + longtitude);

		

		function showError(error) {
			switch (error.code) {
			case error.PERMISSION_DENIED:
				console.error("User denied the request for Geolocation.")
				break;
			case error.POSITION_UNAVAILABLE:
				console.error("Location information is unavailable.")
				break;
			case error.TIMEOUT:
				console.error("The request to get user location timed out.")
				break;
			case error.UNKNOWN_ERROR:
				console.error("An unknown error occurred.")
				break;
			}
		}
	});