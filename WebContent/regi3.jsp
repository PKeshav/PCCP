<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@include file="dbaccess.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	if (request.getParameter("form_x").toString() != "") {
		session.setAttribute(
				"password",
				session.getAttribute("password") + "i"
						+ request.getParameter("form_no") + "x"
						+ request.getParameter("form_x") + "y"
						+ request.getParameter("form_y"));
	}
	String username = session.getAttribute("thename").toString();
	String password = session.getAttribute("password").toString();
	int result = 0;

	Actor actor = new Actor();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if (!actor.getUser(username).next()) {
			System.out.println("into the if");
			result = actor.setUser(username, password);
		}
	%>
	<%=username + "<br>" + session.getAttribute("password")
					+ "<br/>" + result%>

	<%
		//File creation
		File strFile = new File(session.getAttribute("thename").toString());
		boolean fileCreated = strFile.createNewFile();
		//File appending
		Writer objWriter = new BufferedWriter(new FileWriter(strFile));
		objWriter.write("Only you can view and edit this file!");
		objWriter.flush();
		objWriter.close();
		//End of File creation
		
		response.sendRedirect("success.jsp");
	%>
</body>
</html>