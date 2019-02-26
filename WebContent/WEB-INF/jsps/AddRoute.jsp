<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table>
<form action="addroute">
<tr><td>source</td><td><input type="text" name="source"></td></tr>
<tr><td>destination</td><td><input type="text" name="destination"></td></tr>
<tr><td>distance</td><td><input type="text" name="distance"></td></tr>
<tr><td>travelDuration</td><td><input type="text" name="travelDuration"></td></tr>
<tr><td><input type="submit" value="Add Route"></td></tr>
</form>
<h2 style="color:red;">${res}</h2>


</table>

</body>
</html>