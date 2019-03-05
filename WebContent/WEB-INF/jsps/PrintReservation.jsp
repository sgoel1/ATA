<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script>
function myFunction() {
  window.print();
}
</script>
<title>Booking Detail</title>
</head>
<body>
<br><br>
<div style="float: right;margin-right: 50px;"><button onclick="myFunction()">Print</button></div><br>
<h2 align="center">Your Booking Details</h2>
<div align="center">
<table>
	<tr><th>Reservation ID : </th><td>${reservationBean.reservationID}</td></tr>
	<tr><th>User ID : </th><td>${reservationBean.userID}</td></tr>
	<tr><th>Route ID : </th><td>${reservationBean.routeID}</td></tr>
	<tr><th>Booking Date : </th><td>${reservationBean.bookingDate}</td></tr>
	<tr><th>Journey Date : </th><td>${reservationBean.journeyDate}</td></tr>
	<tr><th>Boarding Point : </th><td>${reservationBean.boardingPoint}</td></tr>
	<tr><th>Drop Point : </th><td>${reservationBean.dropPoint}</td></tr>
	<tr><th>Total Fare : </th><td>Rs. ${reservationBean.totalFare}</td></tr>
	<tr><th>Booking Status : </th><td>${reservationBean.bookingStatus}</td></tr>
</table>
</div>

</body>
</html>