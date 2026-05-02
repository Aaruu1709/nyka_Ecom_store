<%@ page import="java.sql.*" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Products</title>
</head>
<body>

<!-- 🔐 Admin Check -->
<%
String role = (String) session.getAttribute("role");

if(role == null || !role.equals("admin")) {
    response.sendRedirect("login.jsp");
}
%>

<h2>All Products</h2>

<table border="1" cellpadding="10">
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Price</th>
    <th>Description</th>
    <th>Edit</th>
    <th>Delete</th>
</tr>

<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/naykafashion","root","root");

    PreparedStatement ps = con.prepareStatement("SELECT * FROM products");

    ResultSet rs = ps.executeQuery();

    while(rs.next()) {
%>

<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("name") %></td>
    <td>₹<%= rs.getDouble("price") %></td>
    <td><%= rs.getString("description") %></td>

    <td>
        <a href="editProduct.jsp?id=<%= rs.getInt("id") %>">Edit</a>
    </td>

    <td>
        <a href="deleteProduct?id=<%= rs.getInt("id") %>">Delete</a>
    </td>
</tr>

<%
    }

    con.close();

} catch(Exception e) {
    out.print("<h3 style='color:red'>Error: " + e.getMessage() + "</h3>");
}
%>

</table>

<br><br>

<a href="admin.jsp">⬅ Back to Admin</a>

</body>
</html>
