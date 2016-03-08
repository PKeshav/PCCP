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
if((int)session.getAttribute("n")<(int)session.getAttribute("imgcount")-1)
{
	session.setAttribute("result", "0");
}
int x1 = Integer.parseInt(request.getParameter("form_x"));
int x2 = Integer.parseInt(((String[])session.getAttribute("xco"))[(int)session.getAttribute("n")]);
int y1 = Integer.parseInt(request.getParameter("form_y"));
int y2 = Integer.parseInt(((String[])session.getAttribute("yco"))[(int)session.getAttribute("n")]);
int diffx=x1-x2;
int diffy=y1-y2;
System.out.println(diffx+" "+x1+" "+x2);

if(diffx<15&&diffx>-15&&diffy<15&&diffy>-15&&session.getAttribute("result")=="1")
{
	System.out.println("Success");
	response.sendRedirect("success.jsp");
}
else
{
	System.out.println("Fail");
	response.sendRedirect("fail.jsp");
}
/*
else
{
	System.out.println("Error");
	response.sendRedirect("error.jsp");
}*/
%>
</body>
</html>