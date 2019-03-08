<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

<form action="modified" method="get">
<table class="table table-sm table-dark">
<tr><td>Driver ID</td><td><input type="hidden" name="driverID" value=${driver.driverID}><input type="text" name="dID" value=${driver.driverID} disabled></td></tr>
<tr><td>Name</td><td><input type="text" name="name" value=${driver.name}></td></tr>
<tr><td>Street</td><td><input type="text" name="street" value=${driver.street}></td></tr>
<tr><td>Location</td><td><input type="text" name="location" value=${driver.location}></td></tr>
<tr><td>City</td><td><input type="text" name="city" value=${driver.city}></td></tr>
<tr><td>State</td><td><input type="text" name="state" value=${driver.state}></td></tr>
<tr><td>Pin Code</td><td><input type="text" name="pincode" value=${driver.pincode}></td></tr>
<tr><td>Mobile Number</td><td><input type="text" name="mobileNo" value=${driver.mobileNo}></td></tr>
<tr><td>License Number</td><td><input type="text" name="licenseNumber" value=${driver.licenseNumber}></td></tr>
<tr><td><input type="submit" class="btn btn-info btn-lg" value="Update Driver" data-toggle="modal" data-target="#myModal"></td></tr>
</table>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Success</h4>
        </div>
        <div class="modal-body">
          <p>Driver Details Updated</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</body>
</html>