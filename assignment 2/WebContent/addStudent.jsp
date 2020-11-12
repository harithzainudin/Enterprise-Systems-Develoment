<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String dept = request.getParameter("dept");
	String science = request.getParameter("science");
	String math = request.getParameter("math");
	String english = request.getParameter("english");
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/db1?useTimezone=true&serverTimezone=UTC", "root", "V@nilla7");
	PreparedStatement stmt = conn.prepareStatement("insert into student(id, name, department, science_marks, math_marks, english_marks) values (?,?,?,?,?,?)");
	stmt.setString(1, id);
	stmt.setString(2, name);
	stmt.setString(3, dept);
	stmt.setString(4, science);
	stmt.setString(5, math);
	stmt.setString(6, english);
	stmt.executeUpdate();
	
%>

<form method="get" action="addStudent.html">
	<input type="submit" value="Go Back to add more student">
</form>

<form method="get" action="homepage.jsp">
	<input type="submit" value="Homepage">
</form>

</body>
</html>