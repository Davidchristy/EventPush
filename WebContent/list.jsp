<% 

	int currentLocation = -1;
	int currentRadius = -1;
	EventRetriever eventRetriever = new EventRetriever(currentLocation, currentRadius);
	Events [] currentEvents = eventRetriever.getEventArray();

%>

<div class="list-column">
    <h2>Upcoming Events</h2>
    <ul class="event-list">
    <%//list loop
    for(int i = 0; i < currentEvents.length; i++ ){ %>
        <li>
        	<h3><a href="#" id="<%= currentEvents[i].getEventID(); %>" class="open-single"><%= currentEvents[i].getEventTitle(); %></a></h3>
        	<span>Starts: <%= currentEvents[i].getStartDate(); %> at </span>
        	<time><%= currentEvents[i].getStartTime(); %></time> 
        	<span>Ends: <%= currentEvents[i].getEndDate(); %> at </span>
        	<time><%= currentEvents[i].getEndTime(); %></time> 
       </li>
   <%}//end list loop %>  
    </ul>
</div>