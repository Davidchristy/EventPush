package Controller;

import java.util.ArrayList;
import java.util.List;
import java.io.IOException;
import java.sql.*;

import javax.sql.*;

import Model.Event;

public class EventManager{

// Instance Variables
	
	private float 	currentLng;
	private float 	currentLat;
	private int 	currentRadius;
	private List<Event> eventList;
	private java.sql.Connection con;

	
	
	
	
// Constructors
	
	public EventManager(){

		String DATABASE_NAME = "jdbc:mysql://eventpushdb.c5nzpaopql9i.us-west-1.rds.amazonaws.com:3306/EventPush";
		String DATABASE_USER = "eventpushroot";
		String DATABASE_PASS = "eventpushroot";
		try{
			Class.forName("com.mysql.jdbc.Driver");
			try{
				con = DriverManager.getConnection(DATABASE_NAME,
						DATABASE_USER, DATABASE_PASS);
			}catch(Exception e){
				e.printStackTrace();
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		//25 miles from Gould-Simpson
		currentLat 		= (float) 32.2297642;
		currentLng 		= (float) -110.95486390000002;
		currentRadius 	= 25;
		this.fetchEvents(currentLat, currentLng, currentRadius, "date");
	}// end default constructor
	
	
	
	public EventManager(float lng, float lat, int radius){

		String DATABASE_NAME = "jdbc:mysql://eventpushdb.c5nzpaopql9i.us-west-1.rds.amazonaws.com:3306/EventPush";
		String DATABASE_USER = "eventpushroot";
		String DATABASE_PASS = "eventpushroot";
		try{
			Class.forName("com.mysql.jdbc.Driver");
			try{
				con = DriverManager.getConnection(DATABASE_NAME,
						DATABASE_USER, DATABASE_PASS);
			}catch(Exception e){
				e.printStackTrace();
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		currentLng		= lng;
		currentLat 		= lat;
		currentRadius 	= radius;
		this.fetchEvents(currentLat, currentLng, currentRadius, "date");
	}// end constructor with lng, lat, and radius	

	
	
	
// Getters / Setters	
	
		public List<Event> getEventList(){
			return eventList;
		}// end getEventArray()

	
		public void setCurrentCenter(float lng, float lat){
			currentLng = lng;
			currentLat = lat;
		}// end setCurrentCenter( float lng, float lat)

		
		public void setCurrentRadius(int radius){
			currentRadius = radius;
		}// end setCurrentRadius(int radius)
		
		
		
		
		
// Public Methods	
	
		
		public List<Event> orderEventListBy(String order){
		
			eventList = this.fetchEvents(currentLng, currentLat, currentRadius, order);
			return eventList;
		}
		
		
	public Event getEvent(int eID){

		String IEI = "INVALID EVENT ID";
			
		Event newEvent = new Event(-1, -1, -1, IEI, IEI, IEI, IEI, IEI, IEI, 
								   IEI, IEI, IEI, IEI, -1, -1, -1);

		Statement st;
		try{
			st = con.createStatement();
			
			String query = "SELECT * "
						 + "FROM Events "
						 + "WHERE `event-id` = '" + eID + "';";
			
			ResultSet rs = st.executeQuery(query);

			while (rs.next()){

				int eventID = (int) rs.getObject("event-id");
				int userID = (int) rs.getObject("user-id");
				int categoryID = (int) rs.getObject("category-id");
				String eventTitle = (String) rs.getObject("event-title");
				String description = (String) rs.getObject("description");
				String locationName = (String) rs.getObject("location-name");
				String address = (String) rs.getObject("address");
				String city = (String) rs.getObject("city");
				String state = (String) rs.getObject("state");
				float lng = rs.getFloat("lng");
				float lat = rs.getFloat("lat");

				/*
				 * Use this set up for the rest of this!
				 */
				Object tempO = rs.getObject("zip");
				int zip = 0;
				if (tempO != null){
					zip = (int) tempO;
				}

				Date tempDate = (Date) rs.getObject("start-date");
				String startDate = "---";
				if (tempDate != null){
					startDate = tempDate.toString(); // might want to change
														// dates' and times'
				}

				Time tempTime = (Time) rs.getObject("start-time");
				String startTime = "---";
				if (tempTime != null){
					startTime = tempTime.toString(); // might want to change
														// dates' and times'
				}

				tempDate = (Date) rs.getObject("end-date");
				String endDate = "---";
				if (tempDate != null){
					endDate = tempDate.toString(); // might want to change
													// dates' and times'
				}

				tempTime = (Time) rs.getObject("end-time");
				String endTime = "---";
				if (tempTime != null){
					endTime = tempTime.toString(); // might want to change
													// dates' and times'
				}

				newEvent = new Event(eventID, userID, categoryID, eventTitle,
						description, startDate, startTime, endDate, endTime,
						locationName, address, city, state, zip, lng, lat);
				System.out.println(newEvent.getEventTitle()
						+ "Has Been Created as a New Event Object");
			}
			rs.close();
		}catch(SQLException e){
			e.printStackTrace();
		}

		return newEvent;

	}// end getEvent(int eventID)
	
	
	
	public boolean addEvent(Event event){
		
		Statement st = null;
		try{
			st = con.createStatement();
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		String query = "INSERT INTO Events "
					 + "(`event-title`, `description`, `start-date`, "
					 + "`end-date`, `end-time`, `start-time`, `location-name`, "
					 + "`address`, `city`, `state`, `category-id`, `user-id`, "
					 + "`zip`, `lng`, `lat`) "
					 + "VALUES ('"
					 + event.getEventTitle() + "','"
					 + event.getDescription() + "','"
					 + event.getStartDate() + "','"
					 + event.getEndDate() + "','"
					 + event.getEndTime() + "','"
					 + event.getStartTime() + "','"
					 + event.getLocationName() + "','"
					 + event.getAddress() + "','"
					 + event.getCity() + "','"
					 + event.getState() + "','"
					 + event.getCategoryID() + "','"
					 + "0" + "','" //TODO replace 0 with current user id
					 + event.getZip() + "','" 
					 + event.getLng() + "','" 
					 + event.getLat() + "');";
		
		System.out.println(query);
		
		try{
			st.executeUpdate(query);
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
		return true;
	}//end addEvent

	

// Private / Helper methods
	
		private List<Event> fetchEvents(float lng, float lat, int radius, String order){

			// set new currents
			currentLng		= lng;
			currentLat 		= lat;
			currentRadius 	= radius;

			Statement st;
			try{
				
				//get current sql date as a string to onlt display future events
				java.util.Date utilDate = new java.util.Date();
				String today = new java.sql.Date(utilDate.getTime()).toString();
				
				st = con.createStatement();
				
				String distForm = "3959 * acos( " //3959 converts to miles
						+ "cos(radians(" + lat + ")) * "
						+ "cos(radians(lat)) * "
						+ "cos(radians(lng) "
						+ "- radians(" + lng + ")) + "
						+ "sin(radians(" + lat + ")) * "
						+ "sin(radians(lat)))";

				String orderString;
				
				if(order.equals("date")){
					
					orderString = "`start-date`, `start-time`, "
							 + "`end-date`, `end-time`, `distance` DESC";

				}else{
					orderString = "`distance`, `start-date`, `start-time`, "
							 + "`end-date`, `end-time`, `distance` DESC";
				}
				
				String query = "SELECT *, (" + distForm + ") as `distance`"
						 + "FROM Events, "
						 + "HAVING `distance` < " + radius + " "
						 + "WHERE `end-date` >= '" + today + "'"
						 + "ORDER BY " + orderString + ";";
				
				
				
				ResultSet rs = st.executeQuery(query);

				eventList = new ArrayList<Event>();
				while (rs.next()){

					int eventID = (int) rs.getObject("event-id");
					int userID = (int) rs.getObject("user-id");
					int categoryID = (int) rs.getObject("category-id");
					String eventTitle = (String) rs.getObject("event-title");
					String description = (String) rs.getObject("description");
					String locationName = (String) rs.getObject("location-name");
					String address = (String) rs.getObject("address");
					String city = (String) rs.getObject("city");
					String state = (String) rs.getObject("state");
					float eLng = rs.getFloat("lng");
					float eLat = rs.getFloat("lat");

					/*
					 * Use this set up for the rest of this!
					 */
					Object tempO = rs.getObject("zip");
					int zip = 0;
					if (tempO != null){
						zip = (int) tempO;
					}

					Date tempDate = (Date) rs.getObject("start-date");
					String startDate = "---";
					if (tempDate != null){
						startDate = tempDate.toString(); // might want to change
															// dates' and times'
					}

					Time tempTime = (Time) rs.getObject("start-time");
					String startTime = "---";
					if (tempTime != null){
						startTime = tempTime.toString(); // might want to change
															// dates' and times'
					}

					tempDate = (Date) rs.getObject("end-date");
					String endDate = "---";
					if (tempDate != null){
						endDate = tempDate.toString(); // might want to change
														// dates' and times'
					}

					tempTime = (Time) rs.getObject("end-time");
					String endTime = "---";
					if (tempTime != null){
						endTime = tempTime.toString(); // might want to change
														// dates' and times'
					}
					
					/*
					 * Double tempLng = Double.parseDouble((String)
					 * rs.getObject("lng")); double lng = -1; if(tempLng != null){
					 * lng = tempLng.doubleValue(); }
					 * 
					 * Double tempLat = Double.parseDouble((String)
					 * rs.getObject("lat")); double lat = -1; if(tempLat != null){
					 * lat = tempLat.doubleValue(); }
					 */

					eventList.add(new Event(eventID, userID, categoryID,
							eventTitle, description, startDate, startTime, endDate,
							endTime, locationName, address, city, state, zip, eLng,
							eLat));
				}
				rs.close();
			}catch(SQLException e){
				e.printStackTrace();
			}

			// QUERY DB USING center and radius....one day, but not today.

			return eventList;
		}// end retrieveEvents(float lng, float lat, int radius)
		
		

}//end EventManager
