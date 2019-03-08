<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="AdminHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
	function myFunction() {
		alert("Are you sure you want to delete this Route?");
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
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			Modal content
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">New Route</h4>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

	<div class="modal fade" id="myModal1" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">New Route</h4>
				</div>
				<div class="modal-body">
					<table class="table table-sm table-dark">
						<form action="addroute">
							<tr>
								<th>source</th>
								<td><input type="text" name="source" required></td>
							</tr>
							<tr>
								<th>destination</th>
								<td><input type="text" name="destination" required></td>
							</tr>
							<tr>
								<th>distance</th>
								<td><input type="text" name="distance" required></td>
							</tr>
							<tr>
								<th>travelDuration</th>
								<td><input type="text" name="travelDuration" required></td>
							</tr>
							<tr>
								<td><button type="submit"
										style="margin-left: 100%; margin-top: 10%;"
										class="btn btn-info btn-lg">Add Route</button></td>
							</tr>
						</form>
					</table>
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
		data-target="#myModal1">Add Route</button>
	<table border="2" class="table table-striped">
		<tr>
			<th>Route Id</th>
			<th>Source</th>
			<th>destination</th>
			<th>distance</th>
			<th>travelDuration</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<c:forEach items="${rb}" var="item">
			<tr>
				<td>${item.routeID}</td>
				<td>${item.source}</td>
				<td>${item.destination}</td>
				<td>${item.distance}</td>
				<td>${item.travelDuration}</td>
				<td><a href="modifyRoute?routeID=${item.routeID}"
					data-toggle="modal" data-target="#myModal"> Edit </a></td>
				<td><a href="deleteRoute?routeID=${item.routeID}"
					onclick="myFunction()"> Delete </a></td>
			</tr>
		</c:forEach>
	</table>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</body>
</html>