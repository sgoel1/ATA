<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.errmsg {
	color: red;
}
</style>
</head>
<body>
<h1>${message}</h1>
	<f:form action="addDriver" commandName="driverBean" method="get">
		<table>
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
				<td><f:button value="AddDriver">AddUser</f:button></td>
			<tr>
		</table>
	</f:form>
</body>
</html>