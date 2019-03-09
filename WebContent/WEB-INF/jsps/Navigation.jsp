<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ include file="AdminHeader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
	function myFunction() {
		alert("Are you sure you want to delete this Vehicle?");
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
<title>Insert title here</title>
</head>
<body>
	<!-- Modal -->
	<div class="modal fade" id="myModal4" role="dialog">
		<div class="modal-dialog">

			Modal content
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Edit Vehicle</h4>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

	<div class="modal fade" id="myModal5" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">New Route</h4>
				</div>
				<div class="modal-body">
					<form action="addvdb" method="get">
						<table class="table table-sm table-dark">
							<tr>
								<td >Name:</td>
								<td><input type="text" name="name" class="textbox1" /></td>
							<tr>
								<td >Type:</td>
								<td><input type="text" name="type" class="textbox1" /></td>
							<tr>
								<td >Registration
									Number:</td>
								<td><input type="text" name="registrationNumber"
										class="textbox1" /></td>
							<tr>
								<td >Seating
									Capacity:</td>
								<td><input type="text" name="seatingCapacity"
										class="textbox1" /></td>
							<tr>
							<tr>
								<td >Fare Per KM:</td>
								<td><input type="text" name="farePerKM" class="textbox1" /></td>
							<tr>
								<td><button type="submit" class="btn btn-info btn-lg">Add Vehicle</button></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>


	<c:choose>
		<c:when test="${status==true }">
			<div class='alert alert-success alert-dismissible fade in'
				style='width: 500px; margin-left: 30%'>
				<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
		</c:when>
		<c:when test="${status==false }">
			<div class='alert alert-danger alert-dismissible fade in'
				style='width: 500px; margin-left: 30%'>
				<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>
		</c:when>
	</c:choose>
	${res}
	</div>
	<button style="float: right; margin: 30px;" type="button"
		class="btn btn-info btn-lg" data-toggle="modal"
		data-target="#myModal5">Add Vehicle</button>

	<h1></h1>
	<table border="2" class="table table-striped">
		<tr>
			<th>Vehicle Id</th>
			<th>Vehicle Type</th>
			<th>Name</th>
			<th>Registration Number</th>
			<th>Seating Capacity</th>
			<th>Fare Per KM</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<c:forEach items="${vehicleList}" var="item">
			<tr>
				<td>${item.vehicleID}</td>
				<td>${item.type}</td>
				<td>${item.name}</td>
				<td>${item.registrationNumber}</td>
				<td>${item.seatingCapacity}</td>
				<td>${item.farePerKM}</td>
				<td><a
					href="displayEdit?vehicleID=${item.vehicleID}&name=${item.name}&type=${item.type}&registrationNumber=${item.registrationNumber}&seatingCapacity=${item.seatingCapacity}&farePerKM=${item.farePerKM}"
					data-toggle="modal" data-target="#myModal4">Edit</a></td>
				<td><a href="delvdb?vehicleID=${item.vehicleID}" onclick="myFunction()">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</body>
</html>