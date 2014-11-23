<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%

/*


NOTICE: 
	
	From now on we will use the DatabaseManager object to connect to / interract with the
	database. This way we don't have to make as many connections and also have a standardized
	way to query the database.
	
	We can work on this new class by using some of the following code from the old
	jsp/create.jsp file:


String DATABASE_NAME = "jdbc:mysql://eventpushdb.c5nzpaopql9i.us-west-1.rds.amazonaws.com:3306/EventPush";
String DATABASE_USERNAME = "eventpushroot";
String DATABASE_PASS = "eventpushroot";

String eventTitle = request.getParameter("event-title"); 
String description = request.getParameter("description"); 
String category = request.getParameter("category-id"); 
String startDate = request.getParameter("start-date"); 
String startTime = request.getParameter("start-time"); 
String endDate = request.getParameter("end-date");
String endTime = request.getParameter("end-time"); 
String locationName = request.getParameter("location-name");
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String zip = request.getParameter("zip");

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection( DATABASE_NAME, DATABASE_USERNAME, DATABASE_PASS); 
Statement st= con.createStatement(); 

String strsnt = "insert into Events values ('"+eventTitle+"','"+description+
"','"+startDate+"','"+endDate+"','"+endTime+"','"+startTime+"','"+locationName+"','"+address+
"','"+city+"','"+state+"','"+"-1"+"','"+category+"','"+"0"+"','"+zip+"')";

System.out.println(strsnt);

int i=st.executeUpdate(strsnt); 

*/

%>


<div id="form-container">
    <form id="new-event-form" action="/EventPush/jsp/create.jsp" method="post"> 
         
        <fieldset>
            <legend>Event Information</legend>
            
            <div class="form-block two-block">
            	<label for="event-title">Event Title:</label><input type="text" id="event-title" name="event-title" />
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
                <label for="start-date" class="first">Start Date:</label><input type="date" id="start-date" name="start-date" />
                <label for="start-time">Start Time:</label><input type="time" id="start-time" name="start-time" />
                <label for="end-date" class="first">End Date:</label><input type="date" id="end-date" name="end-date" />
                <label for="end-time">End Time:</label><input type="time" id="end-time" name="end-time" />
            </div>
        </fieldset>
                
        <fieldset>
            <legend>Location</legend>
            
            <div class="form-block two-block">
            	<label for="location-name">Location Name:</label><input type="text" id="location-name" name="location-name" />
            </div>
            
            <div class="form-block four-block">
                <label for="address" class="first">Address:</label><input type="text" id="address" name="address" />
                <label for="city">City:</label><input type="text" id="city" name="city" />
                <label for="city" class="first">State:</label><input type="text" id="state" name="state" />
                <label for="city">Zip:</label><input type="text" id="zip" name="zip" />
            </div>
        </fieldset>
        <div class="submit-container">
        	<input type="submit" id="submit" name="submit" value="Submit" />
        </div>
    </form>
</div>