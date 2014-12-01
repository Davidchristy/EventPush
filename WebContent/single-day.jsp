<%@page import="Controller.EventManager"%>
<%@page import="Model.Event"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%
	
	int  year = Integer.parseInt((request.getParameter("yr")));
	int month = Integer.parseInt((request.getParameter("mn")));
	int   day = Integer.parseInt((request.getParameter("dy")));
	float lng = Float.parseFloat((request.getParameter("lng")));
	float lat = Float.parseFloat((request.getParameter("lat")));
	int   rad = Integer.parseInt((request.getParameter("rad")));
	
	EventManager eventRetriever = new EventManager(lng, lat, rad);
	List<Event> eventList = eventRetriever.getEventListFrom(year, month, day);
%>

<div id="single-event-container">

<%  for(int i = 0; i < eventList.size(); i++ ){ %>

	<div class="single-event-box">
        <div class="single-header">
            <h2><%= eventList.get(i).getEventTitle() %></h2>
            <span><%= eventList.get(i).getAddress() %> <%= eventList.get(i).getCity() %>, 
			<%= eventList.get(i).getState() %> <%= eventList.get(i).getZip() %></span>
        </div>
        <div class="single-dates">
            <span><%= eventList.get(i).getStartDate() %></span>
            <time><%= eventList.get(i).getStartTime() %></time>
            
            <span><%= eventList.get(i).getEndDate() %></span>
            <time><%= eventList.get(i).getEndTime() %></time>
        </div>
        
        <div class="single-info">
            <p><%= eventList.get(i).getCategory() %></p>
            <p><%= eventList.get(i).getDescription() %></p>
        </div>  
	</div>
<% }//end for  %>
</div>