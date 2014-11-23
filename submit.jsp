<%@page import="Controller.EventManager"%>
<%@page import="Model.Event"%>
<%

int currentLocation = -1;
int currentRadius = -1;
EventManager eventAdder = new EventManager(currentLocation, currentRadius);
int	 	eventID = -1;
int 	userID = 0;
int 	categoryID = Integer.parseInt(request.getParameter("category-id"));
String 	eventTitle = request.getParameter("event-title");
String 	description = request.getParameter("description");
String 	startDate = request.getParameter("start-date"); //might want to change dates" and times"
String	startTime = request.getParameter("start-time"); //type to something more accurate
String 	endDate = request.getParameter("end-date");
String	endTime = request.getParameter("end-time");
String	locationName = request.getParameter("location-name");
String	address = request.getParameter("address");
String	city = request.getParameter("city");
String	state = request.getParameter("state");
int		zip = Integer.parseInt(request.getParameter("zip"));
Event event = new Event(eventID, userID, categoryID, eventTitle, 
		 description, startDate, startTime, 
		 endDate, endTime, locationName, 
		 address, city, state, zip);
eventAdder.addEvent(event);
%>
<html>
<head><title>Submit Event</title></head>
<body>
	<h3>Event Submitted!</h3><br>
	<a href='index.jsp'>Return to event list.</a>
</body>
</html>