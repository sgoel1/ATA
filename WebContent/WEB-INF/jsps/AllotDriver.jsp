<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<script type="text/javascript">
function allotDriver(reservationid, driverid)
{
	
	var drivrid=document.getElementById(driverid).value;
	var url="allotDriver/?reservationID="+reservationid+"&driverID="+drivrid;
	if(window.XMLHttpRequest)
	{
		req=new XMLHttpRequest();
	}
	else if(window.ActiveXObject)
	{
		req=new ActiveXObject("Microsoft.XMLHTTP")	
	}
	req.onreadystatechange=function(){
		if(req.readyState==4 && req.status==200)
		{
			document.getElementById("status").innerHTML=req.responseText;	
			var row=document.getElementById(reservationid);
			row.parentNode.removeChild(row);
		}
	}
	req.open("GET",url,true);
	req.send(null);
}
</script>

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
	<table border="2" class="table table-striped">
		<tr>
			<td>Reservation Id</td>
			<td>userID</td>
			<td>routeID</td>
			<td>Booking Date</td>
			<td>Journey Date</td>
			<td>Total Fare</td>
			<td>Select Driver</td>
			<td>Allot Driver</td>
		</tr>

		<c:forEach items="${ab}" var="res">
			<tr id="${res.reservationID}">
				<td>${res.reservationID}</td>
				<td>${res.userID}</td>
				<td>${res.routeID}</td>
				<td>${res.bookingDate}</td>
				<td>${res.journeyDate}</td>
				<td>${res.totalFare}</td>
				<td><select name="driverID" id="driverID">
						<option value="">Driver</option>
						<f:forEach items="${ab1}" var="driver">
							<option value=${driver.driverID}>${driver.driverID}</option>
						</f:forEach>
				</select></td>
				<td></td>
				<td><input type="button" onclick="allotDriver('${res.reservationID}','driverID')" value="AllotDriver"/>
				</tr>

		</c:forEach>
		<h2 id="status" align="center" style="color: red;"></h2>
	</table>
</body>
</html>