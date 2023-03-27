<%-- 
    Document   : logging
    Created on : Mar 26, 2023, 8:20:56 PM
    Author     : riham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

    <%-- start web service invocation --%><hr/>
    <%
    try {
	admin.Admin_Service service = new admin.Admin_Service();
	admin.Admin port = service.getAdminPort();
	 // TODO initialize WS operation arguments here
	String username = request.getParameter("un");
	String password = request.getParameter("pass");
	// TODO process result here
	java.lang.String result = port.logging(username, password);
	
    if (result.equals("Login successful")) {
        response.sendRedirect("options.html");
    } else {
out.println("invalid details");
    }        
    } catch (Exception ex) {
    out.println("An error occurred: " + ex.getMessage());
    ex.printStackTrace();
   
    }
    %>
    <%-- end web service invocation --%><hr/>
    </body>
</html>
