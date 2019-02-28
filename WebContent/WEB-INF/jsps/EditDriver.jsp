<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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