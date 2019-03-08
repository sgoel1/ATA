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
  <title>ATA | Route</title>
</head>
<body>

<div style="width:100%;">
<div style="width:20%;">
 ${res}
</div>
<div style="width:80%;">
<table class="table table-sm table-dark">
<form action="addroute">
<tr><td>source</td><td><input type="text" name="source" required></td></tr>
<tr><td>destination</td><td><input type="text" name="destination" required></td></tr>
<tr><td>distance</td><td><input type="text" name="distance" required></td></tr>
<tr><td>travelDuration</td><td><input type="text" name="travelDuration" required></td></tr>
<tr><td><button type="submit" class="btn btn-info btn-lg" >Add Route</button></td></tr>
</form>
</table>
</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</body>
</html>