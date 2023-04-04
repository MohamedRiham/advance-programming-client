<%-- 
    Document   : newjspregister
    Created on : Mar 26, 2023, 12:07:02 PM
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
	customer.Customer_Service service = new customer.Customer_Service();
	customer.Customer port = service.getCustomerPort();
	 // TODO initialize WS operation arguments here
	java.lang.String fullname = request.getParameter("fname");
	java.lang.String email = request.getParameter("email");

String ageStr = request.getParameter("age");
int age = Integer.parseInt(ageStr);
	java.lang.String password = request.getParameter("password");
	// TODO process result here
	java.lang.String result = port.register(fullname, email, age ,password);
if (result.equals("Registration successful!")) {
        response.sendRedirect("place order.jsp");
    }
    else {
            out.println(result);
}
    } catch (Exception ex) {
    out.println("An error occurred: " + ex.getMessage());
    ex.printStackTrace();
}
    %>
    <%-- end web service invocation --%><hr/>
    </body>
</html>
