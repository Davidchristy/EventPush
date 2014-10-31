package coreservlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/** Servlet for creating events and querying the database.
 *  <p>
 *  From <a href="http://courses.coreservlets.com/Course-Materials/">the
 *  coreservlets.com tutorials on servlets, JSP, Struts, JSF, Ajax, GWT, 
 *  Spring, Hibernate/JPA, and Java programming</a>.
 */

public class CreateEventServlet extends HttpServlet {
  
	@Override
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    String docType =
      "<!DOCTYPE HTML>\n";
    out.println(docType +
                "<html>\r\n" + 
                "<head>\r\n" + 
                "  <title>Create Event</title>\r\n" + 
                "</head>\r\n" + 
                "<body>\r\n" + 
                "  <h2>Create Event</h2>\r\n" + 
                "  <form method=\"post\" action=\"http://localhost:8080/EventPush/create/query\">\r\n" + 
                "    <label for=\"name\">Event Name</label>" +
                "    <input type=\"text\" name=\"name\" id=\"name\"><br>\r\n" +
                "    <label for=\"date\">Event Date</label>"+
                "    <input type=\"date\" name=\"date\" id=\"date\"><br>\r\n" + 
                "    <label for=\"time\">Event Time</label>"+
                "    <select name=\"hour\" id=\"time\">\r\n"+
                "		<option value=\"1\">1</option>\r\n" + 
                "		<option value=\"2\">2</option>\r\n" + 
                "		<option value=\"3\">3</option>\r\n" + 
                "		<option value=\"4\">4</option>\r\n" + 
                "		<option value=\"5\">5</option>\r\n" + 
                "		<option value=\"6\">6</option>\r\n" + 
                "		<option value=\"7\">7</option>\r\n" + 
                "		<option value=\"8\">8</option>\r\n" + 
                "		<option value=\"9\">9</option>\r\n" + 
                "		<option value=\"10\">10</option>\r\n" + 
                "		<option value=\"11\">11</option>\r\n" + 
                "		<option value=\"12\">12</option>\r\n" +
                "    </select>\r\n" +
                ":"+
                "    <select name=\"min\" id=\"time2\">\r\n"+
                "		<option value=\"00\">00</option>\r\n" + 
                "		<option value=\"15\">15</option>\r\n" + 
                "		<option value=\"30\">30</option>\r\n" + 
                "		<option value=\"45\">45</option>\r\n" + 
                "    </select>\r\n" +
                "    <select name=\"ampm\" id=\"time3\">\r\n"+
                "		<option value=\"1\">PM</option>\r\n" + 
                "		<option value=\"0\">AM</option>\r\n" +
                "    </select>\r\n" +
                "    <input type=\"submit\" value=\"Create\">\r\n" + 
                "  </form>\r\n" + 
                "</body>\r\n" + 
                "</html>");
  }
}
