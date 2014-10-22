package Objects;

import java.awt.List;
import java.util.ArrayList;

public class User {
	
	private String name;
	private String password;
	private ArrayList<Categories> categories;
	
	public User(){
		categories = new ArrayList<Categories>();
	}
	
	private void addCategories(Categories category){
		
		categories.add(category);
		
	}

}
