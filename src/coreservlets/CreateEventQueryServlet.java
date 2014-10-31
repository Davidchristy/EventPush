package coreservlets;

import java.io.*;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;
 
public class CreateEventQueryServlet extends HttpServlet {  // JDK 6 and above only
 
   // The doGet() runs once per HTTP GET request to this servlet.
   @Override
   public void doPost(HttpServletRequest request, HttpServletResponse response)
               throws ServletException, IOException {
      // Set the MIME type for the response message
      response.setContentType("text/html");
      // Get a output writer to write the response message into the network socket
      PrintWriter out = response.getWriter();
 
      Connection conn = null;
      Statement stmt = null;
      try {
    	  try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         // Step 1: Allocate a database Connection object
         conn = DriverManager.getConnection(
            "jdbc:mysql://eventpushdb.c5nzpaopql9i.us-west-1.rds.amazonaws.com:3306/EventPush", "eventpushroot", "eventpushroot"); // <== Check!
            // database-URL(hostname, port, default database), username, password
 
         // Step 2: Allocate a Statement object within the Connection
         stmt = conn.createStatement();
 
         String hyphenedDate = request.getParameter("date");
         String delims = "[-]+";
         String[] ymdDate = hyphenedDate.split(delims);
         
         // Step 3: Execute a SQL SELECT query
         String sqlStr = "insert into Events values ("
        		 + "'" + request.getParameter("name") + "','host'," + 
              ymdDate[0] + "," + ymdDate[1] + "," + ymdDate[2] + "," +
              request.getParameter("hour") + "," + request.getParameter("min") +"," + request.getParameter("ampm") + ");";
 
         // Print an HTML page as the output of the query
         out.println("<html><head><title>Query Response</title></head><body>");
         out.println("<h3>Thank you for your query.</h3>");
         out.println("<p>Your query is: " + sqlStr + "</p>"); // Echo for debugging
         int rset = stmt.executeUpdate(sqlStr);  // Send the query to the server
 
         /*
         // Step 4: Process the query result set
         int count = 0;
         while(rset.next()) {
            // Print a paragraph <p>...</p> for each record
            out.println("<p>" + rset.getString("author")
                 + ", " + rset.getString("title")
                 + ", $" + rset.getDouble("price") + "</p>");
            count++;
            count++;
         }
         out.println("<p>==== " + count + " records found =====</p>");
         */
         
         out.println("</body></html>");
     } catch (SQLException ex) {
        ex.printStackTrace();
     } finally {
        out.close();  // Close the output writer
        try {
           // Step 5: Close the resources
           if (stmt != null) stmt.close();
           if (conn != null) conn.close();
        } catch (SQLException ex) {
           ex.printStackTrace();
        }
     }
   }
}