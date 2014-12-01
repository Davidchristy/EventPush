<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@page import="Controller.EventManager"%>
<%@page import="Model.Event"%>
<%@page import="AddressConverter.AddressConverter"%>
<%@page import="AddressConverter.GoogleResponse"%>
<%@page import="AddressConverter.Result"%>


<div id="form-container">
<% 
if (request.getParameter("submit") != null) {
	
	int userID = -1;
	EventManager eventAdder = new EventManager();
	String ErrorStr = "";
	
	int eventID = -1;
	int categoryID = Integer.parseInt(request.getParameter("category-id"));
	String eventTitle = request.getParameter("event-title");
	if(eventTitle.length() == 0){
		ErrorStr += "Event Title ";
	}
	String description = request.getParameter("description");
	String startDate = request.getParameter("start-date"); //might want to change dates" and times"
	if(startDate.length() == 0){
		ErrorStr += "Start Date ";
	}
	String startTime = request.getParameter("start-time"); //type to something more accurate
	if(startTime.length() == 0){
		ErrorStr += "Start Time ";
	}
	String endDate = request.getParameter("end-date");
	if(endDate.length() == 0){
		ErrorStr += "End Date ";
	}
	String endTime = request.getParameter("end-time");
	if(endTime.length() == 0){
		ErrorStr += "End Time ";
	}
	String locationName = request.getParameter("location-name");
	String address = request.getParameter("address");
	if(address.length() == 0){
		ErrorStr += "Address ";
	}
	String city = request.getParameter("city");
	if(city.length() == 0){
		ErrorStr += "City ";
	}
	String state = request.getParameter("state");
	//do we want to check if the state exist?
	if(state.length() == 0){
		ErrorStr += "State ";
	}
	String ZipStr = request.getParameter("zip");
	int zip = 0;
	if(ZipStr.length() == 0){
		ErrorStr += "Zip ";
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
	
%>

<div id="form-container">

<%
	boolean succAdded = eventAdder.addEvent(event);
	if(succAdded){
%>
	<h3>Event Added!</h3>
<%
	}else {
%>
	<h3>Error adding event:</h3>
	<p>Please make sure the following fields are completed: <%= ErrorStr %></p>
<%	
	}//end if succAdded
%>

	
	
	
</div>
	
<%

}//end if submit

%>

<form id="new-event-form" action="create.jsp" method="post">
     
    <fieldset>
        <legend>Event Information</legend>
        
        <div class="form-block two-block">
        	<label for="event-title">Event Title:</label><input type="text" id="event-title" name="event-title" required/>
        </div>
        
        <div class="form-block two-block">
            <label for="description">Description:</label>
            <textarea name="description" id="description" rows="10" cols="80"></textarea>
        </div>
        
        <div class="form-block two-block">
            <label for="categgory">Category:</label>
            <select name="category-id" id="category-id">
            	<option value="-1">---</option>
                <option value="1">Fundraiser</option>
                <option value="2">Party</option>
                <option value="3">Study Session</option>
            </select>
        </div>
        
        <div class="form-block four-block">
            <label for="start-date" class="first">Start Date:</label><input type="date" id="start-date" name="start-date" required/>
            <label for="start-time">Start Time:</label><input type="time" id="start-time" name="start-time" required/>
            <label for="end-date" class="first">End Date:</label><input type="date" id="end-date" name="end-date" required/>
            <label for="end-time">End Time:</label><input type="time" id="end-time" name="end-time" required/>
        </div>
    </fieldset>
            
    <fieldset>
        <legend>Location</legend>
        
        <div class="form-block two-block">
        	<label for="location-name">Location Name:</label><input type="text" id="location-name" name="location-name" />
        </div>
        
        <div class="form-block four-block">
            <label for="address" class="first">Address:</label><input type="text" id="address" name="address" required/>
            <label for="city">City:</label><input type="text" id="city" name="city" required/>
            <label for="city" class="first">State:</label><input type="text" id="state" name="state" required/>
            <label for="city">Zip:</label><input type="text" id="zip" name="zip" required/>
        </div>
    </fieldset>
    <div class="submit-container">
    	<input type="submit" id="submit" name="submit" value="Submit" />
    </div>
</form>
</div>