<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Payment</title>
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
<button type="submit" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Make Payment</button>
 <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Transaction Completed</h4>
        </div>
        <div class="modal-body">
          <p>Payment Done</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
</form>
</body>
</html>