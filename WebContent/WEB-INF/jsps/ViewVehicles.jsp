<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 50%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
#source,#type,#seatingcapacity,#destination,#pickup,#drop {
	padding-left:10px;
	padding-right:10px;
	padding-top:5px;
	padding-bottom:5px;
	font-size: 15px;
	
}
</style>

<script type="text/javascript">
	function sendreqtype(type)
	{
		var req;
		//var seat=document.seatingcapacity.value;
		var url="showvehtype?type="+type;
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
	function sendreqseat(seat)
	{
		var req;
		//var seat=document.seatingcapacity.value;
		var url="showvehseat?seatingcapacity="+seat;
		//document.write(url);
		//document.write(seat);
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
	
	function sendreqsource(source)
	{
		var req;
		//var seat=document.seatingcapacity.value;
		var url="showdestination?source="+source;
		//document.write(url);
		//document.write(seat);
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
				document.getElementById("mydiv1").innerHTML=req.responseText;	
			}
		}
		req.open("GET",url,true);
		req.send(null);
	}
	
</script>

</head>
<body>
	<form action="bookvehicle">
	 <h3 align="center">Select Source & Destination</h3>
	<div align="center">
	<label >Select Source</label>
	<select id="source" name="source" onchange="sendreqsource(this.value)" required style="margin-left: 10px;">
	   <option value="">Source</option>
		<option value="Delhi">Delhi</option>
		<option value="Noida">Noida</option>
		<option value="Faridabad">Faridabad</option>
		<option value="Gurugaon">Gurgaon</option>
	</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<label>Enter Pickup Point</label>&nbsp;&nbsp;<input type="text" name="boardingPoint" id="pickup" required><br><br><br>
	<label >Select Destination</label>&nbsp;&nbsp;<div id="mydiv1"></div><br><br><label>Enter Drop point</label>&nbsp;&nbsp;<input type="text" name="dropPoint" id="drop" required><br><br><br>
	</div>
	
	<div align="center"><h3 align="center">Journey Date</h3><input type="date" name="journeydate" id="pickup"></div><br>
	
	
	<h3 align="center">Select Vehicle</h3>
	<div align="center">
	<label ><!-- <input type="radio" name="vehicle">By Seats</label> -->By seats</label>
	<select id="seatingcapacity"  onchange="sendreqseat(this.value)" >
		<option value="1">one</option>
		<option value="2">two</option>
		<option value="3">three</option>
		<option value="4">four</option>
	</select>
	
	
	<label style="margin-left: 50px;"><!-- <input type="radio" name="vehicle">-->By type </label> 
	<select id="type"  onchange="sendreqtype(this.value) " required>
		<option value="Car">Car</option>
		<option value="Bus">Bus</option>
		<option value="Bike">Bike</option>
		<option value="Jeep">Jeep</option>
	</select>
<br/><br/>

	<!-- This div will display the data -->
	
    <div id="mydiv"></div>
</div>
<br><br><br>
<div align="center"><input id="paybutton" type="submit" value="Proceed To Payment"></div>
</form>
</body>
</html>