<%@page import="Controller.EventManager"%>
<%@page import="Model.Event"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List;"%>

<%
//Get events by month:
//TODO write / call getByMonth method in Controller

// Calendar Calculations: 

// Strange calculations from an assignment spec in 227					
int 	year		= Integer.parseInt(request.getParameter("y"));
int		month		= Integer.parseInt(request.getParameter("m"));
int		c 			= year / 100,				// first 2 digits of the year
		y			= year % 100, 				// last 2 digits of the year
 		monthCode 	= -1, 						// for 1st day calculation
 		w			= -1,						// 1st day of the month
 		numDays		= -1; 						// number of days in the month
boolean	leapYear 	= ((year % 400 == 0)||(year % 100 != 0 && year % 4 == 0)),
		firstWeek 	= true; 					// compensates for 'blank' days
String 	monthName 	= ""; 						// the name of the month	
String currentDate 	= String.format("%d-%02d-01", year, month);
				
EventManager eventManager = new EventManager(); 
List<Event>  eventList = eventManager.getEventListFrom(year, month);
int numEvents = eventList.size();
int curEvent  = 0;

//calculates monthCode, monthName, and numDays
switch(month){
	case 1:
		monthName = "January";
		numDays = 31;
		if(leapYear){
			monthCode = 6;
		}
		else{
			monthCode = 0;
		}
		break;
	case 2:
		monthName = "February";
		if(leapYear){
			numDays = 29;
			monthCode = 2;
		}
		else{
			numDays = 28;
			monthCode = 3;
		}
		break;
	case 3:
		monthName = "March";
		numDays = 31;
		monthCode = 3;
		break;
	case 4:
		monthName = "April";
		numDays = 30;
		monthCode = 6;
		break;
	case 5:
		monthName = "May";
		numDays = 31;
		monthCode = 1;
		break;
	case 6:
		monthName = "June";
		numDays = 30;
		monthCode = 4;
		break;
	case 7:
		monthName = "July";
		numDays = 31;
		monthCode = 6;
		break;
	case 8:
		monthName = "August";
		numDays = 31;
		monthCode = 2;
		break;
	case 9:
		monthName = "Septmber";
		numDays = 30;
		monthCode = 5;
		break;
	case 10:
		monthName = "October";
		numDays = 31;
		monthCode = 0;
		break;
	case 11:
		monthName = "November";
		numDays = 30;
		monthCode = 3;
		break;
	case 12:
		monthName = "December";
		numDays = 31;
		monthCode = 5;
		break;
	default:
			System.out.println("Error");		
}

// calculates the first day of the month
w = ( (int)Math.floor((5*y) / 4) + monthCode - (2*(c%4)) + 7 ) % 7 + 1; 	

//Calendar Output:
%>
<div id="cal-container">
	
	<div class="cal-table">
    
		<div class="cal-row cal-month">
			<a class="prev cal-arrow" href="#" title="Previous Month"></a>
			<h2 id="cal-date"><%=monthName + " " + year%></h2>
			<a class="next cal-arrow" href="#" title="Next Month"></a>
		</div>
		<div class="cal-row">
			<div class="cal-cell cal-h">Sun</div>
			<div class="cal-cell cal-h">Mon</div>
			<div class="cal-cell cal-h">Tue</div>
			<div class="cal-cell cal-h">Wed</div>
			<div class="cal-cell cal-h">Thu</div>
			<div class="cal-cell cal-h">Fri</div>
			<div class="cal-cell cal-h">Sat</div>
		</div>


<%
//continue looping until end of month)
int d = 0;
while (d < numDays){ 
	int dailyEventCount = 0;
%>	
		<div class="cal-row">
<%
	
	//repeat 7 times before going to next row
	for (int j = 0; j < 7 && d < numDays; j++){
		
		// adds 'blank' days on first week to start calendar on right day
		if(firstWeek){
			for (int k = w - 1; k > 0; k--){
%>
			<div class="cal-cell cal-blank"></div>
<%
				j++; //compensates for 'using' a day
				firstWeek = false;
			}//end for
		}//end if

		d++;
		currentDate = String.format("%d-%02d-%02d", year, month, d);
		//OUTPUT SINLE DAY CELL
%>
			<div class="cal-cell">
				<h4><%= d%></h4>
				<ul class="cal-event-list">
<%
		//OUTPUT EVENTS FOR CURRENT DAY
		while(curEvent < numEvents && 
			eventList.get(curEvent).getStartDate().equals(currentDate)){
	
			if(dailyEventCount < 4){
	%>
					<li>
						<a href="#" id="<%= eventList.get(curEvent).getEventID()%>" class="open-single">
							<%= eventList.get(curEvent).getStartTime()%>
						</a>
					</li>
	<%		}
		curEvent++;
		dailyEventCount++;
		}//end while	
		
		if(dailyEventCount == 4){
%>		
				<li>
					<a href="#" id="<%= eventList.get(curEvent).getEventID()%>" class="open-single">
						<%= eventList.get(curEvent).getStartTime()%>
					</a>
				</li>		
<% 		
			curEvent++;
		}else if(dailyEventCount > 4){
			
			String getArgs="yr=" + year + "&mn=" + month + "&dy=" + d;
		
%>
				<li>
					<a href="single-day.jsp?<%=getArgs %>" class="open-daily">See all events...</a>
				</li>
<% 		
		}//end if/esle
		
%>
				</ul>
			</div>
<%	
	}//end for
	//END ROW
%>
		</div>
<%
}//end while
	//END CALENDAR TABLE AND CONTAINER:
%>    
	</div>
</div>