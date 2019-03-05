<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<th>Reservation-ID</th>
		<th>Vehicle-ID</th>
		<th>Route-ID</th>
		<th>Journey Date</th>
		<th>Boarding Point</th>
		<th>Drop Point</th>
		<th>Total Fare</th>
	</tr>
	<tr>
		<td>${reservationDetail.reservationID}</td>
		<td>${reservationDetail.vehicleID}</td>
		<td>${reservationDetail.routeID}</td>
		<td>${reservationDetail.journeyDate }</td>
		<td>${reservationDetail.boardingPoint}</td>
		<td>${reservationDetail.dropPoint}</td>
		<td>${reservationDetail.totalFare}</td>
	</tr>
</table>
<h3 style="color:red;">${paymentSuccess}</h3>
<h3 style="color:green;">${paymentInvalid}</h3>
<form action="checkPayment">
<input type="hidden" value="${reservationDetail.reservationID}" name="resid" >
Credit Card Number:<input type="text" name="creditcard"/><br/><br/>
Valid From:<input type="text" name="validfrom"/>&nbsp;&nbsp;&nbsp;&nbsp;
Valid To:<input type="text" name="validto"/><br/><br/>
Amount:<input type="text" name="balance" value="${reservationDetail.totalFare}" readonly="readonly"/><br/><br/>
<input type="submit" value="Make Payment"/>
</form>
</body>
</html>