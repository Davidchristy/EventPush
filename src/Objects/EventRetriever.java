package Objects;

public class EventRetriever {
	
	private Event[] eventArray;
	private int currentCenter;
	private int currentRadius;
	
	public EventRetriever(){
		
		currentCenter = -1;
		currentRadius = -1;
		this.retrieveEvents(currentCenter, currentRadius);
	}//end default constructor
	
	public EventRetriever(center, radius){
		
		currentCenter = center;
		currentRadius = radius;
		this.retrieveEvents(currentCenter, currentRadius);
	}//end constructor with center and radius
	
	
	
	private Event[] retrieveEvents(){
	
		//QUERY DB USING currentCenter and currentRadius
		return null;
	}//end retrieveEvents()
	
	private Event[] retrieveEvents(int center, int radius){
		
		//set new currents
		currentCenter = center;
		currentRadius = radius;
		
		//QUERY DB USING center and radius
		return null
	}//end retrieveEvents(int center, int radius)
	
	
	public Event[] getEventArray(){
		return eventArray;
	}//end getEventArray()
	
	public Event[] getEventArray(int center, int radius){
		return retrieveEvents(center, radius);
	}//end getEventArray()
	
	public void setCurrentCenter(int center){
		currentCenter = center;
	}//end setCurrentCenter(int center)
	
	public void setCurrentRadius(int radius){
		currentRadius = radius;
	}//end setCurrentRadius(int radius)
	
	
}