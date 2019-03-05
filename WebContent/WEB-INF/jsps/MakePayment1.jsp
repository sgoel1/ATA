<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="checkPayment">
Credit Card Number:<input type="text" name="creditcard"/><br/><br/>
Valid From:<input type="text" name="validfrom"/>&nbsp;&nbsp;&nbsp;&nbsp;
Valid To:<input type="text" name="validto"/><br/><br/>
CreditBalance:<input type="text" name="balance"/><br/><br/>
<input type="submit" value="Make Payment"/>
</form>
</body>
</html>