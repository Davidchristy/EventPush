package Model;
public class Event {

	private int	 	eventID;
	private int 	userID;
	private int 	categoryID;
	private String 	eventTitle;
	private String 	description;
	private String 	startDate; //might want to change dates' and times'
	private String	startTime; //type to something more accurate
	private String 	endDate;
	private String	endTime;
	private String	locationName;
	private String	address;
	private String	city;
	private String	state;
	private int		zip;
	private float	lng;
	private float	lat;
	
	
	public Event(){
	
	this.eventID 	 	= -1;
	this.userID 	 	= -1;
	this.categoryID	 	= -1;
	this.eventTitle	 	= "-1";
	this.description 	= "-1";
	this.startDate 	 	= "-1";
	this.startTime 	 	= "-1";
	this.endDate	 	= "-1";
	this.endTime		= "-1";
	this.locationName 	= "-1";
	this.address 		= "-1";
	this.city 			= "-1";
	this.state 			= "-1";
	this.zip 			= -1;
	this.lng 			= -1;
	this.lat 			= -1;
	
	}
	
	public Event(int eventID, int userID, int categoryID, String eventTitle, 
				 String description, String startDate, String startTime, 
				 String endDate, String endTime, String locationName, 
				 String address, String city, String state, int zip, float lng, float lat){
		
		this.eventID 	 	= eventID;
		this.userID 	 	= userID;
		this.categoryID	 	= categoryID;
		this.eventTitle	 	= eventTitle;
		this.description 	= description;
		this.startDate 	 	= startDate;
		this.startTime 	 	= startTime;
		this.endDate	 	= endDate;
		this.endTime		= endTime;
		this.locationName 	= locationName;
		this.address 		= address;
		this.city 			= city;
		this.state 			= state;
		this.zip 			= zip;
		this.lng 			= lng;
		this.lat			= lat;
		
	}
	
	
	
	public int getEventID() {
		return eventID;
	}
	
	public void setEventID(int eventID) {
		this.eventID = eventID;
	}
	
	public int getUserID() {
		return userID;
	}
	
	public void setUserID(int userID) {
		this.userID = userID;
	}
	
	public int getCategoryID() {
		return categoryID;
	}
	
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}
	
	public String getCategory() {
		return Category.idToName(categoryID);
	}
	
	public String getEventTitle() {
		return eventTitle;
	}
	
	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}
	
	public String getStartDate() {
		return startDate;
	}
	
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getStartTime() {
		return startTime;
	}
	
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	
	public String getEndDate() {
		return endDate;
	}
	
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	public String getEndTime() {
		return endTime;
	}
	
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	public String getLocationName() {
		return locationName;
	}
	
	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}
	
	public String getCity() {
		return city;
	}
	
	public void setCity(String city) {
		this.city = city;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getState() {
		return state;
	}
	
	public void setState(String state) {
		this.state = state;
	}
	
	public int getZip() {
		return zip;
	}
	
	public void setZip(int zip) {
		this.zip = zip;
	}
	
	public float getLng() {
		return lng;
	}
	
	public void setLng(float lng) {
		this.lng = lng;
	}
	
	public float getLat() {
		return lat;
	}
	
	public void setLat(float lat) {
		this.lat = lat;
	}
}