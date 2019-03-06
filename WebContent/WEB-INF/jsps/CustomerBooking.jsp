<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
function myFunction() {
  confirm("Are you sure you want to cancel this reservation?");
}
</script>
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="customerhome">ATA</a>
    </div>
    <ul class="nav navbar-nav">
      
      <li><a href="bookv">+New Reservation</a></li>
      <li><a href="viewresv">View Reservations</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="viewProfile"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
      <li><a href="logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
  </div>
</nav>
<table border="2">
<tr>
<td>Reservation Id</td>
<td>User Id</td>
<td>Booking Date</td>
<td>Journey Date</td>
<td>Boarding Point</td>
<td>DropPoint</td>
<td>Total Fare</td>
<td>Booking Status</td>
</tr>
<c:forEach items="${reslist}" var="item" >
<tr>
<td>${item.reservationID}</td>
<td>${item.userID}</td>
<td>${item.bookingDate}</td>
<td>${item.journeyDate}</td>
<td>${item.boardingPoint}</td>
<td>${item.dropPoint}</td>
<td>${item.totalFare}</td>
<td>${item.bookingStatus}</td>
<td><a href="print?reservationID=${item.reservationID}" > Print </a></td>
<td><a href="deleteboooking?reservationID=${item.reservationID}" onclick="myFunction()"> Delete </a></td>
</tr>
</c:forEach>

</table>

</body>
</html>