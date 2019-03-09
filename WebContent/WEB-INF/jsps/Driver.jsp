<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ include file="AdminHeader.jsp"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
	function myFunction() {
		alert("Are you sure you want to delete this Driver?");
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<div class="modal fade" id="myModal3" role="dialog">
		<div class="modal-dialog">

			Modal content
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Update Driver</h4>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

<div class="modal fade" id="myModal2" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">New Driver</h4>
				</div>
				<div class="modal-body">
					<f:form action="addDriver" commandName="driverBean" method="get">
		<table class="table table-sm table-dark">
			<tr>
				<td>DriverName</td>
				<td><f:input path="name" /> <f:errors path="name"
						cssClass="errmsg" /></td>
			</tr>
			<tr>
				<td>Street</td>
				<td><f:input path="street" /> <f:errors path="street"
						cssClass="errmsg" /></td>
			</tr>
			<tr>
				<td>Location</td>
				<td><f:input path="location" /> <f:errors path="location"
						cssClass="errmsg" /></td>
			</tr>
			<tr>
				<td>City</td>
				<td><f:input path="city" /> <f:errors path="city"
						cssClass="errmsg" /></td>
			</tr>
			<tr>
				<td>State</td>
				<td><f:input path="state" /> <f:errors path="state"
						cssClass="errmsg" /></td>
			</tr>
			<tr>
				<td>Pincode</td>
				<td><f:input path="pincode" /> <f:errors path="pincode"
						cssClass="errmsg" /></td>
			</tr>
			<tr>
				<td>MobileNumber</td>
				<td><f:input path="mobileNo" /> <f:errors
						path="mobileNo" cssClass="errmsg" /></td>
			</tr>
			<tr>
				<td>LicenseNumber</td>
				<td><f:input path="licenseNumber" /> <f:errors
						path="licenseNumber" cssClass="errmsg" /></td>
			</tr>
			<tr>
				<td><f:button value="AddDriver" style="margin-left: 100%; margin-top: 10%;"
										class="btn btn-info btn-lg">Add Driver</f:button></td>
			<tr>
		</table>
	</f:form>
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
		data-target="#myModal2">Add Driver</button>

<table border="2" class="table table-striped">
<tr>
<th>Driver Id</th>
<th>Name</th>
<th>Street</th>
<th>Location</th>
<th>City</th>
<th>State</th>
<th>PinCode</th>
<th>Mobile Number</th>
<th>License Number</th>
<th>Edit</th>
<th>Delete</th>
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
<td><a href="modify?driverID=${item.driverID}" data-toggle="modal" data-target="#myModal3"> Edit </a></td>
<td><a href="delete?driverID=${item.driverID}" onclick="myFunction()"> Delete </a></td>
</tr>
</c:forEach>

</table>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</body>
</html>