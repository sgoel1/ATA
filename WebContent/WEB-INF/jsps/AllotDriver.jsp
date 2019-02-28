<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
	<table border="2">
		<tr>
			<td>Reservation Id</td>
			<td>userID</td>
			<td>routeID</td>
			<td>Booking Date</td>
			<td>Journey Date</td>
			<td>Total Fare</td>
			<td>Select Driver</td>
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