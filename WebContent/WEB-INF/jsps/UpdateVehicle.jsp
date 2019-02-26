<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<f:form action="updatevdb" commandName="vehicleEditBean" method="get">
	<table>
		<tr>
			<td style="font-size: 20px; font-weight: 900;">Vehicle id:</td>
			<td><f:input type="text" path="vehicleID" class="textbox1"/></td>
		<tr>
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
			<td><f:button value="Update Vehicle" class="button1">Update Vehicle</f:button></td>
		</tr>
	</table>
</f:form>
	
</body>
</html>