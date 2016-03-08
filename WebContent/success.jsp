<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	background-color: olive;
}
</style>
</head>
<body>
<h1>You have successfully logged into your account, now you can <a href="logout.jsp">Log out!</a></h1>
<%
session.setAttribute("loggedIn", "yes");

%>
<div>
<%
String txtFilePath = session.getAttribute("thename").toString();

BufferedReader reader = new BufferedReader(new FileReader(txtFilePath));

//BufferedReader br = new InputStreamReader(new FileInputStream(txtFilePath));
StringBuilder sb = new StringBuilder();
String line;

while((line = reader.readLine())!= null){
    sb.append(line+"\n");
} 
%>
<form method="post" action="save.jsp" >
<textarea name="text" rows="20" cols="100" >
<%=sb.toString() %>
</textarea>
<input type="submit" value="Save" />
</form>
</div>
</body>
</html>