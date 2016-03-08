<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<%
if(session.getAttribute("count")==null)
{
	session.setAttribute("count", "nfirst");
	session.setAttribute("message", "");
	}
session.setAttribute("password", "p");
%>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Persuasive Cued Click Points</title>
<style type="text/css">
body {
	background-color: olive;
}
h1 {
text-align: center;
}
</style>
</head>
<body>
	<!-- You are about to start your project!  -->
	<h1>Persuasive Cued Click Points</h1>
	<p>This project implements the Persuasive Cued Click Points
		password scheme which provides high level of security. An important
		goal of the authentication system is to provide support to users in
		selecting better passwords thus increasing security by expanding
		password space. The use of click-based pass words leads to the
		selection of passwords which can be easily hacked. We use persuasive
		technique to influence the user in selecting the password in random
		manner rather than using a particular sequence. Our method
		significantly reduces the drawbacks of the current authentication
		method that is being used.</p>
	<h3>Welcome, choose Register if you are a new user or login if you
		are an existing user.</h3>
	<br>
	<h5 align="center" ><%= session.getAttribute("message") %></h5>
	<form name="form1" method="get" action="regi0.jsp"
		style="text-align: center">
		<input type="text" name="input" placeholder="Enter User Name"
			style="height: 50px; width: 300px; font-size: 30px;"
			onblur="document.form2.input.value = this.value;" required />
			<br>
			<br>
		<input type="submit" value="Register"
			style="height: 50px; width: 300px; font-size: 30px;"></input>
			<br>
	</form>

	<form name="form2" method="get" action="login.jsp" style="text-align: center">
		<input type="hidden" name="input" 
			onblur="document.form1.input.value = this.value;" required />
			<br>
			<input type="submit" value="Login"
			style="height: 50px; width: 300px; font-size: 30px;"></input>
	</form>
</body>
</html>