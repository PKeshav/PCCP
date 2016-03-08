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
if((int)session.getAttribute("n")<(int)session.getAttribute("imgcount"))
{
	System.out.println("checking pixel accuracy");
	
	System.out.println("ilo "+((String[])session.getAttribute("ilo"))[(int)session.getAttribute("n")]);
	System.out.println("xco "+((String[])session.getAttribute("xco"))[(int)session.getAttribute("n")]);
	System.out.println("yco "+((String[])session.getAttribute("yco"))[(int)session.getAttribute("n")]);
	response.sendRedirect("logi3.jsp");
}
else
{
	response.sendRedirect("logi5.jsp");
}
%>
</body>
</html>