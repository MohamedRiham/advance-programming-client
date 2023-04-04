
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view products</title>
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
	java.lang.String result = port.getProducts();
        String[] rows = result.split("\n");

    %>
<table>
  <thead>
    <tr>
      <th>product name</th>
      <th>product price</th>
      <th>quantity</th>
      
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
    <center>
    <h1>order product</h1>
    <form method =  "post" action = "handel orders.jsp">
<p>
<label for="customer Name">customer name:</label>
<input type="text" name="cn" id="username" readonly required/>
</p>

<p>
<label for="ProductName">product name:</label>
<input type="text" name="pn" required>
</p>

<p>
<label for="Product Quantity">quantity:</label>
<input type="number" name="pq" required/>
</p>
   <input type="submit" value="Submit" onclick="saveUsername()">

    </center>
</form>
<script>

function clearUsername() {
localStorage.removeItem("username");
alert("logging out  successfull!");
var usernameInput = document.getElementById("username");
usernameInput.value = "";
		}

window.onload = function() {
var savedUsername = localStorage.getItem("username");
if (savedUsername !== null) {
var usernameInput = document.getElementById("username");
usernameInput.value = savedUsername;
}
};
</script>
    
    </body>
</html>
