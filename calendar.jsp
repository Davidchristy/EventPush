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
int		day 		= 0, 						// current day
 		monthCode 	= 0, 						// for 1st day calculation
 		firstDay	= -1,						// 1st day of the month
 		numDays		= 31, 						// number of days in the month
		monthNum 	= year / 100,				// first 2 digits of the month
		yearNum 	= year - (monthNum*100); 	// last 2 digits of the year
boolean	leapYear 	= false, 					// for monthCode calculation
		firstWeek 	= true; 					// compensates for 'blank' days
String 	monthName 	= ""; 						// the name of the month	


//determines leapYear
if (( year % 400 == 0) || (year % 100 != 0 && year % 4 == 0)){
	leapYear = true;
}

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
firstDay = (((5*yearNum) / 4) + monthCode + 1 - (2 * (monthNum % 4)) + 7) % 7; 	


//Calendar Output:
%>

<div id="cal-container">
	
	<div class="cal-table">
    
		<div class="cal-row cal-month"><h2><%=monthName + " " + year%></h2></div>
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
while (day < numDays){ 
%>	
		<div class="cal-row">
<%
	
	//repeat 7 times before going to next row
	for (int j = 0; j < 7 && day < numDays; j++){
		
		// adds 'blank' days on first week to start calendar on right day
		if(firstWeek){
			for (int k = firstDay - 1; k > 0; k--){
%>
			<div class="cal-cell cal-blank"></div>
<%
				j++; //compensates for 'using' a day
				firstWeek = false;
			}//end for
		}//end if
		
	   day++;
	//OUTPUT SINLE DAY CELL
%>
			<div class="cal-cell">
				<h4><%= day%></h4>
				<ul class="cal-event-list">
<%
	//OUTPUT EVENTS FOR CURRENT DAY
	//TODO Method to get events for each day
%>
					<li><a href="#" id="00" class="open-single">00:00AM</a></li>
					<li><a href="#" id="00" class="open-single">00:00AM</a></li>
					<li><a href="#" id="00" class="open-single">00:00AM</a></li>
					<li><a href="#" id="00" class="open-single">00:00AM</a></li>
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