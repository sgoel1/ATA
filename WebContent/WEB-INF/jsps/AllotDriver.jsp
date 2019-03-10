<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="AdminHeader.jsp"  %>
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
	

	<table border="2" class="table table-striped">
		<tr>
			<th>Reservation Id</th>
			<th>userID</th>
			<th>routeID</th>
			<th>Booking Date</th>
			<th>Journey Date</th>
			<th>Total Fare</th>
			<th>Select Driver</th>
			<th>Allot Driver</th>
		</tr>

		<c:forEach items="${ab}" var="res">
			<tr id="${res.reservationID}">
				<td>${res.reservationID}</td>
				<td>${res.userID}</td>
				<td>${res.routeID}</td>
				<td>${res.bookingDate}</td>
				<td>${res.journeyDate}</td>
				<td>${res.totalFare}</td>
				<td><select name="driverID" id="driverID" >
						<option value="">Driver</option>
						<f:forEach items="${ab1}" var="driver">
							<option value=${driver.driverID}>${driver.driverID}</option>
						</f:forEach>
				</select></td>
				<td><input class="btn btn-info btn-md" type="button" onclick="allotDriver('${res.reservationID}','driverID')" value="Allot" style="font-size: 15px;"/>
				</tr>

		</c:forEach>
		<h2 align="center">${emptyList}</h2>
		<div id="status"></div>
		
	</table>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</body>
</html>