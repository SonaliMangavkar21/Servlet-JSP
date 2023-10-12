<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!String url = "jdbc:mysql://localhost:3306/wejm5";
	String user = "root";
	String password = "root";%>
<%!Connection connection = null;
	PreparedStatement preparedStatement = null;
	int result = 0;%>
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String email = request.getParameter("email;");
String mock1 = request.getParameter("mock1");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jdbc Operation</title>
</head>
<body>
	<%!public void openConnection() {
		try {
			connection = DriverManager.getConnection(url, user, password);
			String query = "insert into std values(?,?,?,?)";
			preparedStatement = connection.prepareStatement(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}%>
	<%
	openConnection();
	preparedStatement.setString(1, id);
	preparedStatement.setString(2, name);
	preparedStatement.setString(3, email);
	preparedStatement.setString(4, mock1);
	result = preparedStatement.executeUpdate();
	%>
	<%
	if (result != 0) {
	%>
	<h1>record inserted successfully..!!</h1>
	<%
	} else {
	%>
	<h1>record not inserted..!!</h1>
	<%
	}
	%>



</body>
</html>