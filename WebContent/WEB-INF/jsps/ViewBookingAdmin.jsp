<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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

</script>

</head>
<body>
Select Source:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<select id="source" name="source" required style="margin-left: 10px;">
	   <option value="">Source</option>
		<option value="delhi">Delhi</option>
		<option value="Noida">Noida</option>
		<option value="Faridabad">Faridabad</option>
		<option value="Gurugaon">Gurgaon</option>
</select>
<br/>
<br/>
Select Destination:
<select id="destination" name="destination" required style="margin-left: 10px;">
	   <option value="">Destination</option>
		<option value="Delhi">Delhi</option>
		<option value="indore">indore</option>
		<option value="Noida">Noida</option>
		<option value="Faridabad">Faridabad</option>
		<option value="Gurugaon">Gurgaon</option>
</select>
<br/>
<br/>
Select Journey Date: <input type="date" id="journeydate" name="journeydate"/>
<br/>
<br/>
<input type="button" value="View Bookings" onclick="getBooking()"/>

<div id="mydiv"></div>
</body>
</html>