package Model;

import java.awt.List;
import java.util.ArrayList;

public class User {
	
	private String userName;
	private int userID;
	
	public User(){
		setUserID(-1);
		setUserName("");
	}
	
	public User(int id, String name){
		setUserID(id);
		setUserName(name);
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
}
