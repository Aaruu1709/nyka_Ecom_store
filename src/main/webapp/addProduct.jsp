<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
if(session.getAttribute("role") == null ||
   !session.getAttribute("role").equals("admin")) {

    response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>

<style>

body{
    font-family:Arial;
    background:#f5f5f5;
}

.container{

    width:400px;

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

</style>

</head>

<body>

<div class="container">

<h2>Add Product</h2>

<form action="addProduct" method="post">

    Product Name:
    <input type="text" name="name" required />

    Price:
    <input type="number"
           step="0.01"
           name="price"
           required />

    Description:
    <textarea name="description" required>
    </textarea>

    Product Image URL:
    <input type="text"
           name="image"
           placeholder="Paste image URL here"
           required />

    <button type="submit">
        Add Product
    </button>

</form>

<br>

<a href="admin.jsp">
    Back to Dashboard
</a>

</div>

</body>
</html>