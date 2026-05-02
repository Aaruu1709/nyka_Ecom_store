<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register here</title>
</head>
<body>
<form action="regForm" method="post">
<h2>Registration Form</h2>

name:<input type="text" name="name" /><br><br>
Email: <input type="text" name="email" /><br><br>
password:<input type="password" name="pass" /><br><br>
gender:<input type="radio" value="male" name="gender" /> Male <input type="radio" value="female" name="gender">female<br>
<br><br>
city:<select name="city">
<option> select city</option>
<option>Delhi</option>
<option>mumbai</option>
<option>Pune</option>
<option>Banglore</option>

</select><br><br>
<input type="submit" value="register"/><br><br>
<p>Already registered? <a href="login.jsp">Login here</a></p>


</form>
</body>
</html>