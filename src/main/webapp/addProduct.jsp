<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
if(session.getAttribute("role") == null || !session.getAttribute("role").equals("admin")) {
    response.sendRedirect("login.jsp");
}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>
</head>
<body>

<h2>Add Product</h2>

<form action="addProduct" method="post">

    Product Name:
    <input type="text" name="name" required />
    <br><br>

    Price:
    <input type="number" step="0.01" name="price" required />
    <br><br>

    Description:
    <textarea name="description" required></textarea>
    <br><br>

    <input type="submit" value="Add Product" />

</form>

<br>

<a href="admin.jsp">Back to Admin Dashboard</a>

</body>
</html>
