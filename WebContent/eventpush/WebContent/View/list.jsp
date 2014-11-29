

<%@page import="Controller.EventManager"%>
<%@page import="Model.Event"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%
	int currentLocation = -1;
	int currentRadius = -1;
	EventManager eventRetriever = new EventManager(currentLocation, currentRadius);
	List<Event> currentEvents = eventRetriever.getEventList();
%>

<div class="list-column">
    <h2>Upcoming Events</h2>
    <ul class="event-list">
    <%for(int i = 0; i < currentEvents.size(); i++ ){ %>
        <li>
        	<h3><a href="#" id="<%= currentEvents.get(i).getEventID() %>" class="open-single"><%= currentEvents.get(i).getEventTitle() %></a></h3>
        	<span>Starts: <%= currentEvents.get(i).getStartDate() %> at </span>
        	<time><%= currentEvents.get(i).getStartTime() %></time> 
        	<span>Ends: <%= currentEvents.get(i).getEndDate() %> at </span>
        	<time><%= currentEvents.get(i).getEndTime() %></time> 
       </li>
   <%}//end list loop %>  
    </ul>
</div>