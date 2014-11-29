<%@page import="Controller.EventManager"%>
<%@page import="Model.Event"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List;"%>


<%
	float 	currentLng 	= -1; //TODO get real coordinates
	float 	currentLat 	= -1; //TODO get real coordinates
	int 	currentRad	= -1; //TODO get value from radius field
	//EventManager eventManager = new EventManager(currentLng, currentLat, currentRad);
	//default constructor shows 25 miles from GS
	EventManager eventManager = new EventManager(); 
	List<Event>  upcomingEvents = eventManager.getEventList();
	List<Event>  nearbyEvents	= eventManager.orderEventListBy("distance");
%>

<div class="list-column">
    <h2>Upcoming Events</h2>
    <ul class="event-list">
    <%for(int i = 0; i < upcomingEvents.size(); i++ ){ %>
        <li>
        	<h3><a href="#" id="<%= upcomingEvents.get(i).getEventID() %>" class="open-single"><%= upcomingEvents.get(i).getEventTitle() %></a></h3>
        	<span>Starts: <%= upcomingEvents.get(i).getStartDate() %> at </span>
        	<time><%= upcomingEvents.get(i).getStartTime() %></time> 
        	<span>Ends: <%= upcomingEvents.get(i).getEndDate() %> at </span>
        	<time><%= upcomingEvents.get(i).getEndTime() %></time> 
       </li>
   <%}//end list loop %>  
    </ul>
</div>

<div class="list-column">
    <h2>Nearby Events</h2>
    <ul class="event-list">
    <%for(int i = 0; i < nearbyEvents.size(); i++ ){ %>
        <li>
        	<h3><a href="#" id="<%= nearbyEvents.get(i).getEventID() %>" class="open-single"><%= nearbyEvents.get(i).getEventTitle() %></a></h3>
        	<span>Starts: <%= nearbyEvents.get(i).getStartDate() %> at </span>
        	<time><%= nearbyEvents.get(i).getStartTime() %></time> 
        	<span>Ends: <%= nearbyEvents.get(i).getEndDate() %> at </span>
        	<time><%= nearbyEvents.get(i).getEndTime() %></time> 
       </li>
   <%}//end list loop %>  
    </ul>
</div>
