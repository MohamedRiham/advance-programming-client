<%-- 
    Document   : insert product
    Created on : Mar 31, 2023, 10:39:36 AM
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
	java.lang.String productName = request.getParameter("pname");
	int productPrice = Integer.parseInt(request.getParameter("pprice"));

	int quantity = Integer.parseInt(request.getParameter("pquantity"));
	// TODO process result here
	java.lang.String result = port.addProduct(productName, productPrice, quantity);
	out.println("Result = "+result);
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    <%-- end web service invocation --%><hr/>
    </body>
</html>
