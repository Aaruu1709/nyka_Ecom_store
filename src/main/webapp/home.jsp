<%@ page import="java.sql.*" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nykaa Fashion</title>

<style>

body{
    margin:0;
    font-family:Arial;
    background-color:#f5f5f5;
}

/* ================= NAVBAR ================= */

.navbar{

    background-color:black;

    color:white;

    display:flex;

    justify-content:space-between;

    align-items:center;

    padding:15px 30px;
}

/* Logo */

.logo{

    font-size:30px;

    font-weight:bold;

    color:#ff3f6c;
}

/* Menu */

.menu a{

    color:white;

    text-decoration:none;

    margin-left:25px;

    font-size:18px;
}

.menu a:hover{

    color:#ff3f6c;
}

/* Welcome */

.welcome{

    padding:20px;
}

/* ================= PRODUCTS ================= */

.heading{

    padding-left:20px;
}

/* Product Container */

.product-container{

    display:flex;

    flex-wrap:wrap;

    gap:25px;

    padding:20px;
}

/* Product Card */

.product-card{

    width:260px;

    background-color:white;

    border-radius:10px;

    overflow:hidden;

    box-shadow:0px 0px 10px lightgray;

    transition:0.3s;
}

/* Hover Effect */

.product-card:hover{

    transform:translateY(-5px);
}

/* Product Image */

.product-card img{

    width:100%;

    height:250px;

    object-fit:cover;
}

/* Product Info */

.product-info{

    padding:15px;
}

.price{

    color:#ff3f6c;

    font-size:20px;

    font-weight:bold;
}

/* Button */

.btn{

    background-color:#ff3f6c;

    color:white;

    border:none;

    padding:10px 15px;

    margin-top:10px;

    cursor:pointer;

    border-radius:5px;
}

.btn:hover{

    background-color:black;
}

</style>

</head>

<body>

<!-- Session Check -->

<%
if(session.getAttribute("name") == null) {

    response.sendRedirect("login.jsp");
}
%>

<!-- ================= NAVBAR ================= -->

<div class="navbar">

    <div class="logo">
        Nykaa Fashion
    </div>

    <div class="menu">

        <a href="home.jsp">Home</a>

        <a href="#">Products</a>

        <a href="#">Categories</a>

        <a href="#">Cart</a>

        <a href="#">Orders</a>

        <a href="#">Profile</a>

        <a href="logout">Logout</a>

    </div>

</div>

<!-- Welcome -->

<div class="welcome">

    <h2>
        Welcome ${sessionScope.name}
    </h2>

</div>

<hr>

<h2 class="heading">
    Available Products
</h2>

<!-- ================= PRODUCTS ================= -->

<div class="product-container">

<%

try {

    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con =
            DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/naykafashion",
            "root",
            "root");

    PreparedStatement ps =
            con.prepareStatement(
            "SELECT * FROM products");

    ResultSet rs = ps.executeQuery();

    while(rs.next()) {

%>

    <!-- Product Card -->

    <div class="product-card">

        <!-- Product Image -->

<img
src="<%= rs.getString("image") %>"
style="
width:100%;
height:250px;
object-fit:cover;">
        <!-- Product Details -->

        <div class="product-info">

            <h3>
                <%= rs.getString("name") %>
            </h3>

            <p class="price">
                ₹ <%= rs.getDouble("price") %>
            </p>

            <p>
                <%= rs.getString("description") %>
            </p>

            <button class="btn">
                Add to Cart
            </button>

        </div>

    </div>

<%
    }

    con.close();

} catch(Exception e) {

    out.print("Error : " + e.getMessage());
}
%>

</div>

</body>
</html>