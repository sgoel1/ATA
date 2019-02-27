<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="modifiedRoute" method="get">

<table>
<tr><td>Route ID</td><td><input type="hidden" name="routeID" value=${route.routeID}><input type="text" name="rID" value=${route.routeID} disabled></td></tr>
<tr><td>Source</td><td><input type="text" name="source" value=${route.source}></td></tr>
<tr><td>Destination</td><td><input type="text" name="destination" value=${route.destination}></td></tr>
<tr><td>Distance</td><td><input type="text" name="distance" value=${route.distance}></td></tr>
<tr><td>TravelDuration</td><td><input type="text" name="travelDuration" value=${route.travelDuration}></td></tr>
<tr><td><input type="submit" value="Update"></td></tr>
</table>
</form>
<h2>${message1}</h2>
</body>
</html>