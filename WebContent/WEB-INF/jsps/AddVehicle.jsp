<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
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

	${res}
	<f:form action="addvdb" commandName="vehicleBean" method="get">
	<table table class="table table-sm table-dark">
		<tr>
			<td style="font-size: 20px; font-weight: 900;">Name:</td>
			<td><f:input type="text" path="name" class="textbox1" /></td>
		<tr>
			<td style="font-size: 20px; font-weight: 900;">Type:</td>
			<td><f:input type="text" path="type" class="textbox1" /></td>
		<tr>
			<td style="font-size: 20px; font-weight: 900;">Registration
				Number:</td>
			<td><f:input type="text" path="registrationNumber" class="textbox1" /></td>
		<tr>
			<td style="font-size: 20px; font-weight: 900;">Seating Capacity:</td>
			<td><f:input type="text" path="seatingCapacity" class="textbox1" /></td>
		<tr>
		<tr>
			<td style="font-size: 20px; font-weight: 900;">Fare Per KM:</td>
			<td><f:input type="text" path="farePerKM" class="textbox1" /></td>
		<tr>
			<td><f:button type="submit" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Add Vehicle</f:button></td>
		</tr>
	</table>
	<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">SUCCESS</h4>
        </div>
        <div class="modal-body">
          <p>Vehicle Added</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
</f:form>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</body>
</html>