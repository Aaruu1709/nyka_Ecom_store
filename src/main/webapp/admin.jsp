<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String role = (String) session.getAttribute("role");//typrcast to String
//here we get session data which created during request 

if(role == null || !role.equals("admin")) {
    response.sendRedirect("login.jsp");
}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin page</title>
</head>
<body>
<h2>Admin Dashboard</h2>

<a href="addProduct.jsp">Add Product</a><br>
<a href="viewProducts.jsp">View Products</a><br>
<a href="viewUsers.jsp">View Users</a><br>

<a href="logout">Logout</a>

</body>
</html>