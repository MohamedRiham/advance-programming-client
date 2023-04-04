<%-- 
    Document   : logging
    Created on : Apr 3, 2023, 5:59:13 AM
    Author     : riham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>logging</title>
    </head>
    <body>

    <%-- start web service invocation --%><hr/>
    <%
    try {
	customer.Customer_Service service = new customer.Customer_Service();
	customer.Customer port = service.getCustomerPort();
	 // TODO initialize WS operation arguments here
java.lang.String username = request.getParameter("un");
java.lang.String password = request.getParameter("pass");
	// TODO process result here
	java.lang.String result = port.logging(username, password);
if (result.equals("Login successful!")) {
response.sendRedirect("place order.jsp");
    
} else {
    out.print(result);
}
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    <%-- end web service invocation --%><hr/>
    </body>
</html>
