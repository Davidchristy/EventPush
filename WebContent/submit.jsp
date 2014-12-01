<%@page import="Controller.EventManager"%>
<%@page import="Model.Event"%>
<%@page import="AddressConverter.AddressConverter"%>
<%@page import="AddressConverter.GoogleResponse"%>
<%@page import="AddressConverter.Result"%>


<%
	String ConfirmStr = "Error Submitting Event";
	String ErrorStr = "You are missing the following field(s):<br />";
	String timeStr = "time = 6";
	int currentLocation = -1;
	int currentRadius = -1;
	EventManager eventAdder = new EventManager();
	int eventID = -1;
	int userID = 0;
	int categoryID = Integer.parseInt(request.getParameter("category-id"));
	String eventTitle = request.getParameter("event-title");
	if(eventTitle.length() == 0){
		ErrorStr += "event-title<br />";
	}
	String description = request.getParameter("description");
	String startDate = request.getParameter("start-date"); //might want to change dates" and times"
	if(startDate.length() == 0){
		ErrorStr += "start-date<br />";
	}
	String startTime = request.getParameter("start-time"); //type to something more accurate
	if(startTime.length() == 0){
		ErrorStr += "start-time<br />";
	}
	String endDate = request.getParameter("end-date");
	if(endDate.length() == 0){
		ErrorStr += "end-date<br />";
	}
	String endTime = request.getParameter("end-time");
	if(endTime.length() == 0){
		ErrorStr += "end-time<br />";
	}
	String locationName = request.getParameter("location-name");
	String address = request.getParameter("address");
	if(address.length() == 0){
		ErrorStr += "address<br />";
	}
	String city = request.getParameter("city");
	if(city.length() == 0){
		ErrorStr += "city<br />";
	}
	String state = request.getParameter("state");
	//do we want to check if the state exist?
	if(state.length() == 0){
		ErrorStr += "state<br />";
	}
	String ZipStr = request.getParameter("zip");
	int zip = 0;
	if(ZipStr.length() == 0){
		ErrorStr += "zip<br />";
	}else{
	//maybe catching letters here
	zip = Integer.parseInt(ZipStr);
	}
	
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
	
	boolean succAdded = eventAdder.addEvent(event);
	if(succAdded){
		ConfirmStr = "Event Submitted!";
		ErrorStr = "";
	}else {
		timeStr = "time = 20";
	}
%>
<html>
<head>
<title>Submit Event</title>
<script>
	<%=timeStr%>
	var countdown = function() {
		if (time == 0) {
			history.go(-1);
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
	<h3><%=ConfirmStr%></h3>
	<br>
	<%=ErrorStr%>
	<a href='index.jsp'>Return to event list.</a> Your browser should
	automatically redirect you in
	<a id='time'></a> seconds...
</body>
</html>
