<%-- 
    Document   : handel orders
    Created on : Apr 1, 2023, 4:16:35 PM
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
	java.lang.String customername = request.getParameter("cn");
	java.lang.String productname = request.getParameter("pn");
	int qty = Integer.parseInt(request.getParameter("pq"));
	// TODO process result here
	java.lang.String result = port.orderProduct(customername, productname, qty);
	out.println("Result = "+result);
       
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    <%-- end web service invocation --%><hr/>
    </body>
</html>
