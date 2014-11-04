package Objects;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

import javax.sql.*;





public class EventRetriever {
	
	private List<Event> eventArray;
	private int currentCenter;
	private int currentRadius;
	private java.sql.Connection con;
	
	
	
	
	public EventRetriever(){
	
		/*
		 * Duplicated code, it's horrible and I have a few hours left
		 */
		String DATABASE_NAME = "jdbc:mysql://eventpushdb.c5nzpaopql9i.us-west-1.rds.amazonaws.com:3306/EventPush";
		String DATABASE_USERNAME = "eventpushroot";
		String DATABASE_PASS = "eventpushroot";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			try {
				con = DriverManager.getConnection( DATABASE_NAME, DATABASE_USERNAME, DATABASE_PASS);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		/*
		 * it's good past this
		 */
		
		currentCenter = -1;
		currentRadius = -1;
		this.retrieveEvents(currentCenter, currentRadius);
	}//end default constructor
	
	public EventRetriever(int center, int radius){
		
		String DATABASE_NAME = "jdbc:mysql://eventpushdb.c5nzpaopql9i.us-west-1.rds.amazonaws.com:3306/EventPush";
		String DATABASE_USERNAME = "eventpushroot";
		String DATABASE_PASS = "eventpushroot";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			try {
				con = DriverManager.getConnection( DATABASE_NAME, DATABASE_USERNAME, DATABASE_PASS);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		currentCenter = center;
		currentRadius = radius;
		this.retrieveEvents(currentCenter, currentRadius);
	}//end constructor with center and radius
	
	
	
	private Event[] retrieveEvents(){
	
		//QUERY DB USING currentCenter and currentRadius
		return null;
	}//end retrieveEvents()
	
	private List<Event> retrieveEvents(int center, int radius){
		
		//set new currents
		currentCenter = center;
		currentRadius = radius;
		
		Statement st;
		try {
			st = con.createStatement();
			ResultSet rs; 
			rs = st.executeQuery("select * from Events;");
			eventArray = new ArrayList<Event>();
			while (rs.next()) {
				
				
				int	 	eventID = (int) rs.getObject("event-id");
				int 	userID = (int) rs.getObject("user-id");
				int 	categoryID = (int) rs.getObject("category-id");
				String 	eventTitle = (String) rs.getObject("event-title");
				String 	description = (String) rs.getObject("description");
				String	locationName = (String) rs.getObject("location-name");
				String	address = (String) rs.getObject("address");
				String	city = (String) rs.getObject("city");
				String	state = (String) rs.getObject("state");
				
				
				/*
				 * Use this set up for the rest of this!
				 */
				Object tempO = rs.getObject("zip");
				int zip = 0;
				if(tempO != null){
					zip = (int)tempO;
				}
				
				
				Date temp = (Date) rs.getObject("start-date");
				String 	startDate = "---";
				if(temp != null){
					startDate = temp.toString(); //might want to change dates' and times'	
				}
				
				Time temp1 = (Time) rs.getObject("start-time");
				String 	startTime = "---";
				if(temp != null){
					startTime = temp.toString(); //might want to change dates' and times'	
				}
				
				temp = (Date) rs.getObject("end-date");
				String 	endDate = "---";
				if(temp != null){
					endDate = temp.toString(); //might want to change dates' and times'	
				}
				
				temp1 = (Time) rs.getObject("end-time");
				String 	endTime = "---";
				if(temp != null){
					endTime = temp.toString(); //might want to change dates' and times'	
				}
				
			
				eventArray.add(new Event(eventID, userID, categoryID, eventTitle, description, startDate, startTime, endDate, endTime, locationName, address, city, state, zip));
				System.out.println(eventArray.size());	
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//QUERY DB USING center and radius....one day, but not today.
		

		return eventArray;
	}//end retrieveEvents(int center, int radius)
	
	
	public List<Event> getEventArray(){
		return eventArray;
	}//end getEventArray()
	
	public List<Event> getEventArray(int center, int radius){
		return retrieveEvents(center, radius);
	}//end getEventArray()
	
	public void setCurrentCenter(int center){
		currentCenter = center;
	}//end setCurrentCenter(int center)
	
	public void setCurrentRadius(int radius){
		currentRadius = radius;
	}//end setCurrentRadius(int radius)
	
	
	
	
}