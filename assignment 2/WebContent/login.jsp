<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
	String userID = request.getParameter("id");
	session.putValue("userID", userID);
	String password = request.getParameter("password");

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/db1?useTimezone=true&serverTimezone=UTC", "root", "V@nilla7");
	Statement stmt = conn.createStatement();

	ResultSet rs = stmt.executeQuery(
			"select * from user_data where userID='" + userID + "' and password='" + password + "'");

	try {
		rs.next();
		if (rs.getString("password").equals(password) && rs.getString("userID").equals(userID)) {
			out.println("Welcome " + userID);
		} else {
			out.println("Invalid password or username.");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

<p> <a href="homepage.jsp">Go to database</a> </p>

