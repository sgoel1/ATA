<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="modified" method="get">

<table>
<tr><td>Driver ID</td><td><input type="hidden" name="driverID" value=${driver.driverID}><input type="text" name="dID" value=${driver.driverID} disabled></td></tr>
<tr><td>Name</td><td><input type="text" name="name" value=${driver.name}></td></tr>
<tr><td>Street</td><td><input type="text" name="street" value=${driver.street}></td></tr>
<tr><td>Location</td><td><input type="text" name="location" value=${driver.location}></td></tr>
<tr><td>City</td><td><input type="text" name="city" value=${driver.city}></td></tr>
<tr><td>State</td><td><input type="text" name="state" value=${driver.state}></td></tr>
<tr><td>Pin Code</td><td><input type="text" name="pincode" value=${driver.pincode}></td></tr>
<tr><td>Mobile Number</td><td><input type="text" name="mobileNo" value=${driver.mobileNo}></td></tr>
<tr><td>License Number</td><td><input type="text" name="licenseNumber" value=${driver.licenseNumber}></td></tr>
<tr><td><input type="submit" value="Update"></td></tr>
</table>
</form>
</body>
</html>