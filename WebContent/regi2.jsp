<%@page import="sun.security.util.Password"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	session.setAttribute(
			"password",
			session.getAttribute("password") + "i"
					+ request.getParameter("form_no") + "x"
					+ request.getParameter("form_x") + "y"
					+ request.getParameter("form_y"));
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="0; url=register.jsp" />

<title>Loading</title>
</head>
<body>
	<%=session.getAttribute("password")%>
</body>
</html>