<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<%
if(session.getAttribute("role")==null ||
!session.getAttribute("role").equals("admin")){

    response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Product</title>

<style>

body{
    font-family:Arial;
    background:#f5f5f5;
}

.container{

    width:450px;

    margin:50px auto;

    background:white;

    padding:30px;

    border-radius:10px;

    box-shadow:0px 0px 10px lightgray;
}

input, textarea{

    width:100%;

    padding:10px;

    margin-top:5px;

    margin-bottom:15px;
}

button{

    background:#ff3f6c;

    color:white;

    border:none;

    padding:10px 20px;

    cursor:pointer;

    border-radius:5px;
}

button:hover{

    background:black;
}

img{

    width:150px;

    height:150px;

    object-fit:cover;

    border-radius:10px;

    margin-bottom:10px;
}

</style>

</head>

<body>

<%

int id =
Integer.parseInt(request.getParameter("id"));

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con =
DriverManager.getConnection(
"jdbc:mysql://localhost:3306/naykafashion",
"root",
"root");

PreparedStatement ps =
con.prepareStatement(
"SELECT * FROM products WHERE id=?");

ps.setInt(1,id);

ResultSet rs = ps.executeQuery();

rs.next();

%>

<div class="container">

<h2>Edit Product</h2>

<form action="updateProduct" method="post">

<input type="hidden"
       name="id"
       value="<%= rs.getInt("id") %>">

Name:
<input type="text"
       name="name"
       value="<%= rs.getString("name") %>">

Price:
<input type="number"
       step="0.01"
       name="price"
       value="<%= rs.getDouble("price") %>">

Description:
<textarea name="description"><%= rs.getString("description") %></textarea>

Product Image URL:
<input type="text"
       name="image"
       value="<%= rs.getString("image") %>">

<!-- Current Image -->

<img src="<%= rs.getString("image") %>">

<br>

<button type="submit">
    Update Product
</button>

</form>

</div>

</body>
</html>