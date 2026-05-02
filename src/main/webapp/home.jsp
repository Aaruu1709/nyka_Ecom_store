<%@ page import="java.sql.*" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home - Products</title>
</head>
<body>

<!-- 🔐 Session Check -->
<%
if(session.getAttribute("name") == null) {
    response.sendRedirect("login.jsp");
}
%>

<h2>Welcome ${sessionScope.name}</h2>

<a href="logout">Logout</a>

<hr>

<h2>Available Products</h2>

<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/naykafashion","root","root");

    PreparedStatement ps = con.prepareStatement("SELECT * FROM products");

    ResultSet rs = ps.executeQuery();

    while(rs.next()) {
%>

        <div style="border:1px solid black; padding:10px; margin:10px;">
            <h3><%= rs.getString("name") %></h3>
            <p>Price: ₹<%= rs.getDouble("price") %></p>
            <p><%= rs.getString("description") %></p>
        </div>

<%
    }

    con.close();

} catch(Exception e) {
    out.print("Error: " + e.getMessage());
}
%>


</body>
</html>
