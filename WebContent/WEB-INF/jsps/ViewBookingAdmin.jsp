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
Select Source:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<select id="source" name="source" onchange="sendreqsource(this.value)" style="margin-left: 10px;">
	<option value="">Source</option>
		<c:forEach items="${SourceList}" var="item">
			<option value="${item}">${item}</option>
		</c:forEach>
</select>

<br/>
<br/>
Select Destination:
<div id="mydiv1"></div>
<br/>
<br/>
Select Journey Date: <input type="date" id="journeydate" name="journeydate"/>
<br/>
<br/>
<input type="button" value="View Bookings" onclick="getBooking()"/>

<div id="mydiv"></div>
</body>
</html>