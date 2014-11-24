<%@page import="Controller.EventManager"%>
<%@page import="Model.Event"%>
<%@page import="AddressConverter.AddressConverter"%>
<%@page import="AddressConverter.GoogleResponse"%>
<%@page import="AddressConverter.Result"%>


<%
	int currentLocation = -1;
	int currentRadius = -1;
	EventManager eventAdder = new EventManager(currentLocation,
	currentRadius);
	int eventID = -1;
	int userID = 0;
	int categoryID = Integer.parseInt(request
	.getParameter("category-id"));
	String eventTitle = request.getParameter("event-title");
	String description = request.getParameter("description");
	String startDate = request.getParameter("start-date"); //might want to change dates" and times"
	String startTime = request.getParameter("start-time"); //type to something more accurate
	String endDate = request.getParameter("end-date");
	String endTime = request.getParameter("end-time");
	String locationName = request.getParameter("location-name");
	String address = request.getParameter("address");
	String city = request.getParameter("city");
	String state = request.getParameter("state");
	int zip = Integer.parseInt(request.getParameter("zip"));

	/* Generate lng and lat here from address info w/ Google API*/
	float lng; //Assign these
	float lat;

	AddressConverter converter = new AddressConverter();
	String strAddress = address + " " + city + " " + state + " " + zip;
	GoogleResponse google = converter.convertToLatLong(strAddress);

	String latitude = "", longtitude = "";
	for(Result result : google.getResults()){
	latitude = result.getGeometry().getLocation().getLat();
	longtitude = result.getGeometry().getLocation().getLng();
	}
	lat = Float.parseFloat(latitude);
	lng = Float.parseFloat(longtitude);

	Event event = new Event(eventID, userID, categoryID, eventTitle,
	description, startDate, startTime, endDate, endTime,
	locationName, address, city, state, zip, lng, lat);
	eventAdder.addEvent(event);
%>
<html>
<head>
<title>Submit Event</title>
<script>
	time = 6
	var countdown = function() {
		if (time == 0) {
			window.location.replace('http://www.eventpushtucson.com');
		} else {
			document.getElementById('time').innerHTML = time;
			time = time - 1;
			setTimeout(countdown, 1000);
		}
	}
	window.addEventListener("load", countdown);
</script>
</head>
<body>
	<h3>Event Submitted!</h3>
	<br>
	<a href='index.jsp'>Return to event list.</a> Your browser should
	automatically redirect you in
	<a id='time'></a> seconds...
</body>
</html>
