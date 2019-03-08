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
 
 <c:choose>
 	<c:when test="${status==true }">
 		 <div class='alert alert-success alert-dismissible fade in' style='width: 500px; margin-left: 30%'> 
 	<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
 	</c:when>
 	<c:when test="${status==false }">
 	<div class='alert alert-danger alert-dismissible fade in' style='width: 500px; margin-left: 30%'> 
 	<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
 	</c:when>
 </c:choose>
 	${res}
 </div>
 
<table border="2" class="table table-striped">
<tr>
<td>Route Id</td>
<td>Source</td>
<td>destination</td>
<td>distance</td>
<td>travelDuration</td>
<td>Edit</td>
<td>Delete</td>
</tr>
<c:forEach items="${rb}" var="item" >
<tr>
<td>${item.routeID}</td>
<td>${item.source}</td>
<td>${item.destination}</td>
<td>${item.distance}</td>
<td>${item.travelDuration}</td>
<td><a href="modifyRoute?routeID=${item.routeID}" > Edit </a></td>
<td><a href="deleteRoute?routeID=${item.routeID}"> Delete </a></td>
</tr>
</c:forEach>
</table>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</body>
</html>