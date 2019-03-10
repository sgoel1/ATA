<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="signup.css">
<title>ATA | SignUp</title>
</head>
<body>
	<div align="center">
	<div id="backgroundborder1">
		<h1>Signup</h1>
		<h3 style="color: red;">${res}</h3>
		<form action="adduserprofile" method="get">
			<table>
				<tr>
					<td>FirstName</td>
					<td><input type="text" name="firstName" class="textbox1" required/></td>
				<tr>
					<td>LastName</td>
					<td><input type="text" name="lastName" class="textbox1" required/></td>
				<tr>
					<td>Date Of Birth</td>
					<td><input type="date" name="dateofbirth" class="textbox1" required/></td>
				<tr>
					<td>Gender</td>
					<td>Male<input type="radio" name="gender" value="male" required/>&nbsp;Female<input
						type="radio" name="gender" value="female" required/></td>
				</tr>
				<tr>
					<td>Location</td>
					<td><input type="text"  name="location"
						class="textbox1" required/></td>
				<tr>
					<td>Street</td>
					<td><input type="text" name="street" class="textbox1" required/></td>
				<tr>
					<td>City</td>
					<td><input type="text" name="city" class="textbox1" required/></td>
				<tr>
					<td>State</td>
					<td><input type="text" name="state" class="textbox1" required/></td>
				<tr>
					<td>Pincode</td>
					<td><input type="text" name="pincode" class="textbox1" required/></td>
				<tr>
					<td>Mobile</td>
					<td><input type="text" name="mobileNo" class="textbox1" required/></td>
				<tr>
					<td>Email</td>
					<td><input type="email" name="emailID" class="textbox1" required/></td>
				<tr>
					<td>Password</td>
					<td><input type="password" name="password" class="textbox1" required/></td>
				<tr>
					<td></td>
					<td><input type="submit" value="Register" class="button1"></td>
				</tr>
				
			</table>
		</form>
		</div>
		</div>
</body>
</html>