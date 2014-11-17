package Model;

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
	
	public static String idToName(int id)
	{
		switch(id)
		{
		case 1:	return "Fundraiser";
		case 2: return "Party";
		case 3: return "Study Session";
		default: return "Category";
		}
	}
}
