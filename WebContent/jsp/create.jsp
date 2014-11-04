<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String DATABASE_NAME = "jdbc:mysql://eventpushdb.c5nzpaopql9i.us-west-1.rds.amazonaws.com:3306/EventPush";
String DATABASE_USERNAME = "eventpushroot";
String DATABASE_PASS = "eventpushroot";

String eventTitle = request.getParameter("event-title"); 
String description = request.getParameter("description"); 
String category = request.getParameter("category-id"); 
String startDate = request.getParameter("start-date"); 
String startTime = request.getParameter("start-time"); 
String endDate = request.getParameter("end-date");
String endTime = request.getParameter("end-time"); 
String locationName = request.getParameter("location-name");
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String zip = request.getParameter("zip");

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection( DATABASE_NAME, DATABASE_USERNAME, DATABASE_PASS); 
Statement st= con.createStatement(); 

String strsnt = "insert into Events values ('"+eventTitle+"','"+description+
"','"+startDate+"','"+endDate+"','"+endTime+"','"+startTime+"','"+locationName+"','"+address+
"','"+city+"','"+state+"','"+"-1"+"','"+category+"','"+"0"+"','"+zip+"')";

System.out.println(strsnt);

int i=st.executeUpdate(strsnt); 

%>