<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1></h1>
	<table border="1">
	<c:forEach items="${vehicleList}" var="item">
	<tr>
	<td>${item.vehicleID}</td>
	<td>${item.type}</td>
	<td>${item.name}</td>
	<td>${item.registrationNumber}</td>
	<td>${item.seatingCapacity}</td>
	<td>${item.farePerKM}</td>
	<td><a href="displayEdit?vehicleID=${item.vehicleID}&name=${item.name}&type=${item.type}&registrationNumber=${item.registrationNumber}&seatingCapacity=${item.seatingCapacity}&farePerKM=${item.farePerKM}">Edit</a></td>
	<td><a href="delvdb?vehicleID=${item.vehicleID}">Delete</a></td>
	</tr>
	</c:forEach>
    </table>
</body>
</html>