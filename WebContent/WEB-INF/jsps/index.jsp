<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="login.css">
	<title>Login Page</title>
</head>
<body>
	<div id="header">
		<div id="heading">Automation of Travel Agency</div>
		<div id="logo"><img src="logo.png"></div>
	<div><br><br><br><br><br><br>
		<img src="image.jpg">
	<div id="backgroundborder">
		<h1>Login</h1>
	<div id="background">	
	<form action="login" method="post">
		<h3 style="color:red;">${msg}</h3><br>
		<input type="text" name="userID" placeholder="Username" class="textbox" required/><br>
		<input type="password" name="password" placeholder="Password" class="textbox" required/><br><br>
		&nbsp;&nbsp;<input type="checkbox" name="checkbox"><strong style="color: white;">Remember me on this computer!</strong><br><br>
		<input type="submit"  value="Login"  class="button"/>
	</form>
   </div>
   <h3 style="text-align: center;">New User ? <a href="adduser">Register here</a></h3>
</div>
<div id="footer">Copyright @ 2019 YAMAHA MOTOR SOLUTIONS.All Rights reserved</div>

</body>
</html>