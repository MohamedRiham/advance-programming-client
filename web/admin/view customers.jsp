<%-- 
    Document   : view customers
    Created on : Mar 27, 2023, 7:49:25 PM
    Author     : riham
--%>
<%@page import="java.util.Arrays" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table {
                border-collapse: collapse;
                border: 1px solid black;
            }
            th, td {
                border: 1px solid black;
                padding: 8px;
            }
        </style>
    </head>
    <body>

    <%-- start web service invocation --%><hr/>
    <%
    try {
        admin.Admin_Service service = new admin.Admin_Service();
        admin.Admin port = service.getAdminPort();
        // TODO process result here
        java.lang.String result = port.getCustomers();        
        // Split the result string into individual rows
        String[] rows = result.split("\n");
        
        // Display the rows in an HTML table
    %>
<table>
  <thead>
    <tr>
      <th>Username</th>
      <th>Email</th>
      <th>age</th>
      <th>Password</th>
    </tr>
  </thead>
  <tbody>
    <% for (String row : rows) { %>
      <tr>
        <% 
          String[] columns = row.split(", ");
          for (String column : columns) { 
            String[] parts = column.split(": ");
            String value = parts.length > 1 ? parts[1] : "";
        %>
          <td><%= value %></td>
        <% } %>
      </tr>
    <% } %>
  </tbody>
</table>
    <% 
    } catch (Exception ex) {
    out.println("An error occurred while invoking the web service: " + ex.getMessage());

    }
    %>
    <%-- end web service invocation --%><hr/>
    </body>
</html>
