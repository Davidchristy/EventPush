<%@page import="Controller.EventManager"%>
<%@page import="Model.Event"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List;"%>


<%
	int currentLocation = -1;
	int currentRadius 	= -1;
	EventManager eventRetriever = new EventManager(currentLocation, currentRadius);
	List<Event> upcomingEvents 	= eventRetriever.getEventArray();
	List<Event> nearbyEvents 	= eventRetriever.getEventArray();
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
