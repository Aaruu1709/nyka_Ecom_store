<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%

String role =
(String) session.getAttribute("role");

if(role == null || !role.equals("admin")) {

    response.sendRedirect("login.jsp");
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<style>

body{

    margin:0;

    font-family:Arial;

    background:#f5f5f5;
}

/* ================= NAVBAR ================= */

.navbar{

    background:black;

    color:white;

    display:flex;

    justify-content:space-between;

    align-items:center;

    padding:15px 30px;
}

/* Logo */

.logo{

    font-size:28px;

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

/* ================= CONTENT ================= */

.container{

    padding:30px;
}

.welcome{

    font-size:30px;

    margin-bottom:30px;
}

/* Dashboard Cards */

.card-container{

    display:flex;

    flex-wrap:wrap;

    gap:25px;
}

.card{

    width:250px;

    background:white;

    padding:25px;

    border-radius:10px;

    box-shadow:0px 0px 10px lightgray;

    transition:0.3s;
}

.card:hover{

    transform:translateY(-5px);
}

/* Buttons */

.card a{

    display:inline-block;

    margin-top:15px;

    background:#ff3f6c;

    color:white;

    padding:10px 15px;

    text-decoration:none;

    border-radius:5px;
}

.card a:hover{

    background:black;
}

</style>

</head>

<body>

<!-- ================= NAVBAR ================= -->

<div class="navbar">

    <div class="logo">
        Nykaa Admin
    </div>

    <div class="menu">

        <a href="admin.jsp">Dashboard</a>

        <!-- HOME PAGE OPTION -->

        <a href="home.jsp">View Store</a>

        <a href="addProduct.jsp">Add Product</a>

        <a href="viewProducts.jsp">Products</a>

        <a href="viewUsers.jsp">Users</a>

        <a href="logout">Logout</a>

    </div>

</div>

<!-- ================= CONTENT ================= -->

<div class="container">

    <div class="welcome">

        Welcome Admin 👋

    </div>

    <!-- Dashboard Cards -->

    <div class="card-container">

        <!-- Add Product -->

        <div class="card">

            <h2>Add Product</h2>

            <p>
                Add new products into store.
            </p>

            <a href="addProduct.jsp">
                Open
            </a>

        </div>

        <!-- View Products -->

        <div class="card">

            <h2>Manage Products</h2>

            <p>
                View, edit and delete products.
            </p>

            <a href="viewProducts.jsp">
                Open
            </a>

        </div>

        <!-- View Users -->

        <div class="card">

            <h2>Users</h2>

            <p>
                View registered users.
            </p>

            <a href="viewUsers.jsp">
                Open
            </a>

        </div>

        <!-- View Store -->

        <div class="card">

            <h2>View Website</h2>

            <p>
                See how products appear to users.
            </p>

            <a href="home.jsp">
                Open Store
            </a>

        </div>

    </div>

</div>

</body>
</html>