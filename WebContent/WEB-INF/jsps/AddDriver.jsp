<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
.errmsg {
	color: red;
}
</style>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="adminhome">ATA</a>
    </div>
    <ul class="nav navbar-nav">
     <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">ROUTE<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="route">Add Route</a></li>
          <li><a href="showRoute">Modify/Delete Route</a></li>
        </ul>
      </li>
      
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">DRIVER<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="add">Add Driver</a></li>
          <li><a href="showDriver">Modify/Delete Driver</a></li>
        </ul>
      </li>
      
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">VEHICLE<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="display">Add Vehicle</a></li>
          <li><a href="showall">Modify/Delete Vehicle</a></li>
        </ul>
      </li>
      
        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">BOOKING<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="allotdriver">Allot Driver</a></li>
          <li><a href="viewBookingPage">View Reservation</a></li>
        </ul>
      </li>
      
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
      <li><a href="logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
  </div>
</nav>

<h1>${message}</h1>
	<f:form action="addDriver" commandName="driverBean" method="get">
		<table class="table table-sm table-dark">>
			<tr>
				<td>DriverName</td>
				<td><f:input path="name" /> <f:errors path="name"
						cssClass="errmsg" /></td>
			</tr>
			<tr>
				<td>Street</td>
				<td><f:input path="street" /> <f:errors path="street"
						cssClass="errmsg" /></td>
			</tr>
			<tr>
				<td>Location</td>
				<td><f:input path="location" /> <f:errors path="location"
						cssClass="errmsg" /></td>
			</tr>
			<tr>
				<td>City</td>
				<td><f:input path="city" /> <f:errors path="city"
						cssClass="errmsg" /></td>
			</tr>
			<tr>
				<td>State</td>
				<td><f:input path="state" /> <f:errors path="state"
						cssClass="errmsg" /></td>
			</tr>
			<tr>
				<td>Pincode</td>
				<td><f:input path="pincode" /> <f:errors path="pincode"
						cssClass="errmsg" /></td>
			</tr>
			<tr>
				<td>MobileNumber</td>
				<td><f:input path="mobileNo" /> <f:errors
						path="mobileNo" cssClass="errmsg" /></td>
			</tr>
			<tr>
				<td>LicenseNumber</td>
				<td><f:input path="licenseNumber" /> <f:errors
						path="licenseNumber" cssClass="errmsg" /></td>
			</tr>
			<tr>
				<td><f:button value="AddDriver">AddUser</f:button></td>
			<tr>
		</table>
	</f:form>
</body>
</html>