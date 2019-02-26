<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib  prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="login.css">
	<title>SignUp</title>
</head>
<body>
	<div id="backgroundborder1" >
		<h1>Signup</h1>
		<f:form action="adduserprofile" commandName="profileBean" method="get"><table>
			<tr><td style="font-size: 20px; font-weight: 900;">FirstName</td><td><f:input type="text" path="firstName" class="textbox1"/></td>
			<tr><td style="font-size: 20px; font-weight: 900;">LastName</td><td><f:input type="text" path="lastName" class="textbox1"/></td>
			<tr><td style="font-size: 20px; font-weight: 900;">Date Of Birth</td><td><f:input type="date" path="dateOfBirth" class="textbox1"/></td>
			<tr><td style="font-size: 20px; font-weight: 900;">Gender</td><td>Male<f:radiobutton  path="gender" value="male"/>&nbsp;Female<f:radiobutton path="gender" value="male"/></td></tr>
			<tr><td style="font-size: 20px; font-weight: 900;">Location</td><td><f:input type="text" path="location" class="textbox1"/></td>
			<tr><td style="font-size: 20px; font-weight: 900;">Street</td><td><f:input type="text" path="street" class="textbox1"/></td>
			<tr><td style="font-size: 20px; font-weight: 900;">City</td><td><f:input type="text" path="city" class="textbox1"/></td><br>
			<tr><td style="font-size: 20px; font-weight: 900;">State</td><td><f:input type="text" path="state" class="textbox1"/></td>
			<tr><td style="font-size: 20px; font-weight: 900;">Pincode</td><td><f:input type="text" path="pincode" class="textbox1"/></td>
			<tr><td style="font-size: 20px; font-weight: 900;">Mobile</td><td><f:input type="text" path="mobileNo" class="textbox1"/></td>
			<tr><td style="font-size: 20px; font-weight: 900;">Email</td><td><f:input type="email" path="emailID" class="textbox1"/></td>
			<tr><td style="font-size: 20px; font-weight: 900;">Password</td><td><f:input type="password" path="password" class="textbox1"/></td>
			<tr><td style="font-size: 20px; font-weight: 900;"></td><td><f:button value="AddUser" class="button1">AddUser</f:button></td></tr>
		</table></f:form>
		<h2>${res}</h2>
	<div>
</body>
</html>