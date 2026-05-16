<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>
</head>
<body>
<form action="loginForm" method="post">
Email:<input type="text" name="email"><br><br>
Password:<input type="password" name="pass"><br><br>
<input type="submit" value="login"> 
<br>
<br>
<p>New user? <a href="register.jsp">Register here</a></p>

</form>
</body>
</html>