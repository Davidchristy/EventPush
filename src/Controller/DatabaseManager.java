package Controller;

import java.sql.DriverManager;
import java.sql.SQLException;


/*
 * We will use this class to connect to the database as well as interact with it
 * once a connection has been established.
 */

public class DatabaseManager {

	private String DATABASE_URL; 		// "jdbc:mysql://eventpushdb.c5nzpaopql9i.us-west-1.rds.amazonaws.com:3306/EventPush";
	private String DATABASE_USERNAME;  	//"eventpushroot";
	private String DATABASE_PASS;		// "eventpushroot";
	 private java.sql.Connection con;
	
	
	public DatabaseManager(String url, String username, String pass){
		String DATABASE_NAME = url;
		String DATABASE_USERNAME =  username;
		String DATABASE_PASS = pass;
		
		startConnection(url, username, pass);
	}	
	
	
	private boolean startConnection(String url, String username, String pass){
	
		try {
            Class.forName("com.mysql.jdbc.Driver");
            try {
                con = DriverManager.getConnection( url, username, pass);
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
		return true;
	}//end startConnection
	
	
}//end DatabaseManager