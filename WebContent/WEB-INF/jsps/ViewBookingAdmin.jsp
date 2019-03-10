<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       <%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="AdminHeader.jsp"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>

<script>
function getBooking()
{
	var source=document.getElementById("source").value;
	var destination=document.getElementById("destination").value;
	var journeydate=document.getElementById("journeydate").value;
	
	//document.write(source);
	//document.write(destination);
	//document.write(date);
	
	var url="viewBooking?source="+source+"&destination="+destination+"&journeydate="+journeydate;
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
			//document.write("inside req change");
			document.getElementById("mydiv").innerHTML=req.responseText;	
		}
	}
	req.open("GET",url,true);
	req.send(null);
}

function sendreqsource(source) {
	var req;
	//var seat=document.seatingcapacity.value;
	var url = "viewdestination?source=" + source;
	//document.write(url);
	//document.write(seat);
	if (window.XMLHttpRequest) {
		req = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		req = new ActiveXObject("Microsoft.XMLHTTP")
	}
	req.onreadystatechange = function() {
		if (req.readyState == 4 && req.status == 200) {
			//document.write("inside req change");
			document.getElementById("mydiv1").innerHTML = req.responseText;
		}
	}
	req.open("GET", url, true);
	req.send(null);
}

</script>

</head>
<body>

<div style="background-color: #F5F5F5;">
<label style="margin: 20px; float:left;">Select Source:</label>
<select id="source" name="source" onchange="sendreqsource(this.value)" style="margin: 20px;margin-left:5px; float:left;">
	<option value="">Source</option>
		<c:forEach items="${SourceList}" var="item">
			<option value="${item}">${item}</option>
		</c:forEach>
</select>


<label style="margin: 20px; float:left;">Select Destination:</label>
<div id="mydiv1" style="float:left; margin:20px; margin-left: 5px;" ></div>

<label style="margin: 20px;">Select Journey Date:</label> <input type="date" id="journeydate" name="journeydate" style="margin-right: 20px;"/>

<input type="button" value="View Bookings" onclick="getBooking()" class="btn btn-primary"/>
</div>
<br><br>
<div id="mydiv">
<table class="table table-striped">
	
		<tr>
			<th scope="col">Reservation ID</th>
			<th scope="col">User ID</th>
			<th scope="col">Route ID</th>
			<th scope="col">Vehicle ID</th>
			<th scope="col">Booking Date</th>
			<th scope="col">Journey Date</th>
			<th scope="col">Booking Status</th>
		</tr>
	
	<f:forEach items="${AllReservations}" var="resv">
		<tr>
			<td>${resv.reservationID}</td>
			<td>${resv.userID}</td>
			<td>${resv.routeID}</td>
			<td>${resv.vehicleID}</td>
			<td>${resv.bookingDate}</td>
			<td>${resv.journeyDate}</td>
			<td>${resv.bookingStatus}</td>
		</tr>	
	</f:forEach>
	
</table>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</body>
</html>