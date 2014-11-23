package Controller;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

import javax.sql.*;

import Model.Event;

public class EventManager {
    
    private List<Event> eventArray;
    private int currentCenter;
    private int currentRadius;
    private java.sql.Connection con;
    
    public EventManager(){
        
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
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        /*
         * it's good past this
         */
        
        currentCenter = -1;
        currentRadius = -1;
        this.retrieveEvents(currentCenter, currentRadius);
    }//end default constructor
    
    public EventManager(int center, int radius){
        
        String DATABASE_NAME = "jdbc:mysql://eventpushdb.c5nzpaopql9i.us-west-1.rds.amazonaws.com:3306/EventPush";
        String DATABASE_USERNAME = "eventpushroot";
        String DATABASE_PASS = "eventpushroot";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            try {
                con = DriverManager.getConnection( DATABASE_NAME, DATABASE_USERNAME, DATABASE_PASS);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        } catch (Exception e) {
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
                float lng = rs.getFloat("lng");
                float lat = rs.getFloat("lat");
                
                
                /*
                 * Use this set up for the rest of this!
                 */
                Object tempO = rs.getObject("zip");
                int zip = 0;
                if(tempO != null){
                    zip = (int)tempO;
                }
                
                
                Date tempDate = (Date) rs.getObject("start-date");
                String 	startDate = "---";
                if(tempDate != null){
                    startDate = tempDate.toString(); //might want to change dates' and times'
                }
                
                Time tempTime = (Time) rs.getObject("start-time");
                String 	startTime = "---";
                if(tempTime != null){
                    startTime = tempTime.toString(); //might want to change dates' and times'
                }
                
                tempDate = (Date) rs.getObject("end-date");
                String 	endDate = "---";
                if(tempDate != null){
                    endDate = tempDate.toString(); //might want to change dates' and times'
                }
                
                tempTime = (Time) rs.getObject("end-time");
                String 	endTime = "---";
                if(tempTime != null){
                    endTime = tempTime.toString(); //might want to change dates' and times'	
                }
                /*
                Double tempLng = Double.parseDouble((String) rs.getObject("lng"));
                double 	lng = -1;
                if(tempLng != null){
                    lng = tempLng.doubleValue();
                }
                
                Double tempLat = Double.parseDouble((String) rs.getObject("lat"));
                double 	lat = -1;
                if(tempLat != null){
                    lat = tempLat.doubleValue();
                }*/
                
                
                eventArray.add(new Event(eventID, userID, categoryID, eventTitle, description, startDate, startTime, endDate, endTime, locationName, address, city, state, zip,lng,lat));
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

    
    public Event getEvent(int eID){
        
        Event newEvent = new Event(-1, -1, -1, "INVALID EVENT ID", "INVALID EVENT ID", "INVALID EVENT ID", "INVALID EVENT ID", "INVALID EVENT ID", "INVALID EVENT ID", "INVALID EVENT ID", "INVALID EVENT ID", "INVALID EVENT ID", "INVALID EVENT ID", -1,-1,-1);
        
        Statement st;
        try {
            st = con.createStatement();
            ResultSet rs;
            rs = st.executeQuery("select * from Events where `event-id` = '" + eID + "';");
            
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
                float	lng = rs.getFloat("lng");
                float	lat = rs.getFloat("lat");
                
                
                /*
                 * Use this set up for the rest of this!
                 */
                Object tempO = rs.getObject("zip");
                int zip = 0;
                if(tempO != null){
                    zip = (int)tempO;
                }
                
                
                Date tempDate = (Date) rs.getObject("start-date");
                String 	startDate = "---";
                if(tempDate != null){
                    startDate = tempDate.toString(); //might want to change dates' and times'
                }
                
                Time tempTime = (Time) rs.getObject("start-time");
                String 	startTime = "---";
                if(tempTime != null){
                    startTime = tempTime.toString(); //might want to change dates' and times'
                }
                
                tempDate = (Date) rs.getObject("end-date");
                String 	endDate = "---";
                if(tempDate != null){
                    endDate = tempDate.toString(); //might want to change dates' and times'
                }
                
                tempTime = (Time) rs.getObject("end-time");
                String 	endTime = "---";
                if(tempTime != null){
                    endTime = tempTime.toString(); //might want to change dates' and times'
                }
                
                
                newEvent = new Event(eventID, userID, categoryID, eventTitle, description, startDate, startTime, endDate, endTime, locationName, address, city, state, zip, lng, lat);
                System.out.println(newEvent.getEventTitle() + "Has Been Created as a New Event Object");
            }
            rs.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return newEvent;
        
    }//end getEvent(int eventID)
    
    public void addEvent(Event event) {
    	Statement st = null;
    	try {
			st = con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
    	String strsnt = "insert into Events (`event-title`, `description`, `start-date`, `end-date`, `end-time`, `start-time`, `location-name`, `address`, `city`, `state`, `category-id`, `user-id`, `zip`, `lng`, `lat`) values ('"+event.getEventTitle()+"','"+event.getDescription()+
    			"','"+event.getStartDate()+"','"+event.getEndDate()+"','"+event.getEndTime()+"','"+event.getStartTime()+"','"+event.getLocationName()+"','"+event.getAddress()+
    			"','"+event.getCity()+"','"+event.getState()+"','"+event.getCategoryID()+"','"+"0"+"','"+event.getZip()+"','"+event.getLng()+"','"+event.getLat()+"');";
    	System.out.println(strsnt);
    	try {
		st.executeUpdate(strsnt);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    }
    
    
    
}
