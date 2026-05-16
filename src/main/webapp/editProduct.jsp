<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Product page</title>
</head>
<body>
<%@ page import="java.sql.*" %>

<%
if(session.getAttribute("role")==null || !session.getAttribute("role").equals("admin")){
    response.sendRedirect("login.jsp");
}
%>


<%
int id = Integer.parseInt(request.getParameter("id"));

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/naykafashion","root","root");

PreparedStatement ps = con.prepareStatement(
"SELECT * FROM products WHERE id=?");

ps.setInt(1, id);

ResultSet rs = ps.executeQuery();

rs.next();
%>

<h2>Edit Product</h2>

<form action="updateProduct" method="post">

<input type="hidden" name="id" value="<%= rs.getInt("id") %>">

Name:
<input type="text" name="name" value="<%= rs.getString("name") %>"><br><br>

Price:
<input type="number" name="price" value="<%= rs.getDouble("price") %>"><br><br>

Description:
<textarea name="description"><%= rs.getString("description") %></textarea><br><br>

<input type="submit" value="Update">

</form>

</body>
</html>