<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
 <title>ATA | Admin</title>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="adminhome">ATA</a>
    </div>
   
    <ul class="nav navbar-nav">
    <li style="font-size: 17px;"><a href="showRoute">Route</a></li>
    <li style="font-size: 17px;"><a href="showDriver">Driver</a></li>
    <li style="font-size: 17px;"><a href="showall">Vehicle</a></li>
     <li style="font-size: 17px;" class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Booking<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="allotdriver">Allot Driver</a></li>
          <li><a href="viewBookingPage">View Reservation</a></li>
        </ul>
      </li>
    </ul>
    
    <ul class="nav navbar-nav navbar-right">
      <li><a href="viewProfile"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
      <li><a href="../logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
  </div>
</nav>

</body>
</html>