<%@page import="Objects.EventRetriever"%>
<%@page import="Objects.Event"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<% 

	 
	int currentEventID	= Integer.parseInt(request.getParameter("eid"));
	int currentLocation	= -1;
	int currentRadius	= -1;
	EventRetriever eventRetriever = new EventRetriever(currentLocation, currentRadius);
	Event currentEvent = eventRetriever.getEvent(currentEventID);

%>

<div id="single-event-container">
	<div class="single-event-box">
        <div class="single-header">
            <h2><%= currentEvent.getEventTitle() %></h2>
            <span><%= currentEvent.getAddress() %> <%= currentEvent.getCity() %>, 
			<%= currentEvent.getState() %> <%= currentEvent.getZip() %></span>
        </div>
        <div class="single-dates">
            <span><%= currentEvent.getStartDate() %></span>
            <time><%= currentEvent.getStartTime() %></time>
            
            <span><%= currentEvent.getEndDate() %></span>
            <time><%= currentEvent.getEndTime() %></time>
        </div>
        
        <div class="single-info">
            <p><%= currentEvent.getCategoryID() %></p>
            <p><%= currentEvent.getDescription() %></p>
        </div>  
	</div>
</div>