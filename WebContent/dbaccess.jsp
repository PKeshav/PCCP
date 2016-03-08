<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%!public class Actor {
		String URL = "jdbc:mysql://localhost:3306/pccp";
		String USERNAME = "root";
		String PASSWORD = "MySQL";

		Connection connection = null;
		PreparedStatement insertUser = null;
		PreparedStatement selectUser = null;
		ResultSet resultSet = null;

		public Actor() {
			try {

				connection = DriverManager.getConnection(URL, USERNAME,
						PASSWORD);
				insertUser = connection.prepareStatement("INSERT INTO accounts"
						+ " (username,password)" + " VALUES (?,?)");
				selectUser = connection.prepareStatement("SELECT password"
						+ " FROM accounts" + " WHERE username=?");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		public int setUser(String userName, String password) {
			int result = 1;

			try {
				insertUser.setString(1, userName);
				insertUser.setString(2, password);
				result = insertUser.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return result;
		}

		public ResultSet getUser(String userName) {
			try {
				selectUser.setString(1, userName);
				resultSet = selectUser.executeQuery();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return resultSet;
		}
	}%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>