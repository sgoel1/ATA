<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
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
	
	<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Edit Vehicle</h4>
				</div>
	
	<form action="updatevdb" method="get">
	<table class="table table-sm table-dark">
		<tr>
			<td >Vehicle id:</td>
			<td><input type="text" name="vehicleID" value="${vehicleEditBean.vehicleID}" class="textbox1" style="background-color: #E8E8E8" readonly="readonly"/></td>
		<tr>
		<tr>
			<td>Name:</td>
			<td><input type="text" name="name" value="${vehicleEditBean.name }" class="textbox1" /></td>
		<tr>
			<td>Type:</td>
			<td><input type="text" name="type" value="${vehicleEditBean.type }" class="textbox1" /></td>
		<tr>
			<td>Registration
				Number:</td>
			<td><input type="text" name="registrationNumber" value="${vehicleEditBean.registrationNumber}" class="textbox1" /></td>
		<tr>
			<td>Seating Capacity:</td>
			<td><input type="text" name="seatingCapacity" value="${vehicleEditBean.seatingCapacity}" class="textbox1" /></td>
		<tr>
		<tr>
			<td>Fare Per KM:</td>
			<td><input type="text" name="farePerKM" value="${vehicleEditBean.farePerKM}" class="textbox1" /></td>
		<tr>
			<td><button type="submit" class="btn btn-info btn-lg" >Update Vehicle</button></td>
		</tr>
	</table>
</form>
<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</body>
</html>