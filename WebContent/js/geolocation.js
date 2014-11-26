	document.addEventListener("load", function() {
			   // One-shot position request.
			   navigator.geolocation.getCurrentPosition(callback);
			
			 
			function callback(position) {
			   console.log(position.coords.latitude);
			   console.log(position.coords.longitude);
			}
	});