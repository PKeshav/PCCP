<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("result")=="1"&&request.getParameter("form_x")=="")
{
	System.out.println("Success");
	response.sendRedirect("success.jsp");
}
else
{
	System.out.println("Fail");
	response.sendRedirect("fail.jsp");
}
%>
</body>
</html>