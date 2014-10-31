package Objects;

public class Category {
	
	private int categoryID;
	private String categoryName;
	
	public Category(int id, String name){
		categoryID = id;
		categoryName = name;
	}
	
	public String getCategoryName() {
		return categoryName;
	}
	
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	public int getCategoryID() {
		return categoryID;
	}
	
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}	
}
