<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String text = request.getParameter("text");
		String file = session.getAttribute("thename").toString();

		FileWriter filewriter = new FileWriter(file, true);
		PrintWriter writer = new PrintWriter(file);
		writer.print("");//replaces
		filewriter.write(text);//appends
		filewriter.close();
		response.sendRedirect("success.jsp");
	%>
</body>
</html>