<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="AdminHeader.jsp"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<table border="2" class="table table-striped">
<tr>
<td>Driver Id</td>
<td>Name</td>
<td>Street</td>
<td>Location</td>
<td>City</td>
<td>State</td>
<td>PinCode</td>
<td>Mobile Number</td>
<td>License Number</td>
<td>Edit</td>
<td>Delete</td>
</tr>
<c:forEach items="${db}" var="item" >
<tr>
<td>${item.driverID}</td>
<td>${item.name}</td>
<td>${item.street}</td>
<td>${item.location}</td>
<td>${item.city}</td>
<td>${item.state}</td>
<td>${item.pincode}</td>
<td>${item.mobileNo}</td>
<td>${item.licenseNumber}</td>
<td><a href="modify?driverID=${item.driverID}" > Edit </a></td>
<td><a href="delete?driverID=${item.driverID}"> Delete </a></td>
</tr>
</c:forEach>

</table>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</body>
</html>