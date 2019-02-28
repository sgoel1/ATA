<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
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
      
      <li><a href="allotdriver">Allot Driver</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
      <li><a href="logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
  </div>
</nav>
	
	<f:form action="updatevdb" commandName="vehicleEditBean" method="get">
	<table>
		<tr>
			<td style="font-size: 20px; font-weight: 900;">Vehicle id:</td>
			<td><f:input type="text" path="vehicleID" class="textbox1"/></td>
		<tr>
		<tr>
			<td style="font-size: 20px; font-weight: 900;">Name:</td>
			<td><f:input type="text" path="name" class="textbox1" /></td>
		<tr>
			<td style="font-size: 20px; font-weight: 900;">Type:</td>
			<td><f:input type="text" path="type" class="textbox1" /></td>
		<tr>
			<td style="font-size: 20px; font-weight: 900;">Registration
				Number:</td>
			<td><f:input type="text" path="registrationNumber" class="textbox1" /></td>
		<tr>
			<td style="font-size: 20px; font-weight: 900;">Seating Capacity:</td>
			<td><f:input type="text" path="seatingCapacity" class="textbox1" /></td>
		<tr>
		<tr>
			<td style="font-size: 20px; font-weight: 900;">Fare Per KM:</td>
			<td><f:input type="text" path="farePerKM" class="textbox1" /></td>
		<tr>
			<td><f:button value="Update Vehicle" class="button1">Update Vehicle</f:button></td>
		</tr>
	</table>
</f:form>
	
</body>
</html>