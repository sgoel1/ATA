<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">&times;</button>
		<h4 class="modal-title">New Route</h4>
	</div>
	<form action="modifiedRoute" method="get">

		<table class="table table-bordered">
			<tr>
				<td>Route ID</td>
				<td><input type="hidden" name="routeID" value=${route.routeID}><input
					type="text" name="rID" value=${route.routeID } disabled></td>
			</tr>
			<tr>
				<td>Source</td>
				<td><input type="text" name="source" value=${route.source}></td>
			</tr>
			<tr>
				<td>Destination</td>
				<td><input type="text" name="destination"
					value=${route.destination}></td>
			</tr>
			<tr>
				<td>Distance</td>
				<td><input type="text" name="distance" value=${route.distance}></td>
			</tr>
			<tr>
				<td>TravelDuration</td>
				<td><input type="text" name="travelDuration"
					value=${route.travelDuration}></td>
			</tr>
			<tr>
				<td><button type="submit" class="btn btn-info btn-lg"
						data-toggle="modal" data-target="#myModal">Update</button></td>
			</tr>
		</table>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		</div>

	</form>
	<h2>${message1}</h2>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</body>
</html>