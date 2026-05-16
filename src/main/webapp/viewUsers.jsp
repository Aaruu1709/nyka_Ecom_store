<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String role = (String) session.getAttribute("role");

if(role == null || !role.equals("admin")) {
    response.sendRedirect("login.jsp");
}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View User page</title>
</head>
<body>
<%@ page import="java.sql.*" %>

<%
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/naykafashion","root","root");

PreparedStatement ps = con.prepareStatement("SELECT * FROM naykausers");
ResultSet rs = ps.executeQuery();
%>

<h2>All Users</h2>

<table border="1">
<tr>
<th>ID</th><th>Name</th><th>Email</th><th>Role</th>
</tr>

<%
while(rs.next()) {
%>
<tr>
<td><%= rs.getInt("id") %></td>
<td><%= rs.getString("name") %></td>
<td><%= rs.getString("email") %></td>
<td><%= rs.getString("role") %></td>
</tr>
<%
}
%>
</table>

</body>
</html>