<%@page import="com.sun.org.apache.bcel.internal.generic.ACONST_NULL"%>
<%@page import="sun.awt.windows.ThemeReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="dbaccess.jsp"%>
<!DOCTYPE html >
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
	<%
		final int a = 0;
		Actor actor = new Actor();
		String username = request.getParameter("input");
		session.setAttribute("thename", username);
		if (!actor.getUser(username).next()) {
			session.setAttribute("message", "User Name does not exist");
			System.out.println(session.getAttribute("message"));
			response.sendRedirect("index.jsp");
		}
		ResultSet password = actor.getUser(username);
		if (password.next()) {

			String pExisting = password.getString("password");
			System.out.println(pExisting);

			int i = 0;
			int j = 0;
			int count = 0;
			for (char ch : pExisting.toCharArray())
				if (ch == 'i')
					count++;
			session.setAttribute("count", count);
			System.out.println("hahaha you got this dude"
					+ session.getAttribute("count"));
			System.out.println(count + "here is this");
			String[] x = new String[count];
			String[] y = new String[count];
			String[] n = new String[count];
			char c[] = pExisting.toCharArray();
			int l = pExisting.length();

			int x1 = 10, x2 = 0, y1 = 10, y2 = 0;
			for (i = 0; i < l; i++) {
				if (c[i] == 'i') {
					if (i > 1) {
						y2 = i;
						x[j] = pExisting.substring(x1, x2);
						System.out.println(x[j]);
						y[j] = pExisting.substring(y1, y2);
						System.out.println(y[j]);
						j++;
					}
					n[j] = pExisting.substring(i + 1, i + 2);
					System.out.println(n[j]);
					x1 = i + 3;
				}
				if (c[i] == 'y') {
					x2 = i;
					y1 = i + 1;
				}
				if (i > y1 && c[i] == 'i') {
					y2 = i;
				} else if (i == l - 1) {
					y2 = i + 1;
					x[j] = pExisting.substring(x1, x2);
					System.out.println(x[j]);
					y[j] = pExisting.substring(y1, y2);
					System.out.println(y[j]);
					j++;
				}
			}
			//checkPassword(count,n,x,y);

			System.out.println(session.getAttribute("image"));
			session.setAttribute("imgcount", count);
			for (Integer abc = 0; abc < count; abc++) {
				//session.setAttribute("image", n[abc]);
				session.setAttribute(abc.toString(), n[abc]);
				session.setAttribute(abc.toString() + "x", x[abc]);
				session.setAttribute(abc.toString() + "y", y[abc]);
			}
			session.setAttribute("xco", x);
			session.setAttribute("yco", y);
			session.setAttribute("ilo", n);
			Integer nImage = 0;
			session.setAttribute("n", nImage);
			session.setAttribute("result", "1");
			response.sendRedirect("logi2.jsp");
		}
	%>

	<%=session.getAttribute("thename")%>

</body>
</html>