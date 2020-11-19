<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My JSP</title>
</head>
<body>
	<h1>Student Marks</h1>
	<table border="1">
		<tr>
			<td>Name</td>
			<td>Science</td>
			<td>Mathematics</td>
			<td>English</td>
			
		</tr>

		<%
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/db1?useTimezone=true&serverTimezone=UTC", "root", "V@nilla7");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from student");
			// ResultSetMetaData rsmd = rs.getMetaData();
			rs.last();
			int rowNumber = rs.getRow();
			int scienceTotal = 0, mathTotal =0 , englishTotal = 0;
			rs.beforeFirst();
			while (rs.next()) {
				
				int scienceMark = Integer.parseInt(rs.getString(4));
				int mathMark = Integer.parseInt(rs.getString(5));
				int englishMark = Integer.parseInt(rs.getString(6));
				
				scienceTotal = scienceTotal + scienceMark;
				mathTotal = mathTotal + mathMark;
				englishTotal = englishTotal +englishMark;
			
		%>

		<tr>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getInt("science_marks")%></td>
			<td><%=rs.getInt("math_marks")%></td>
			<td><%=rs.getInt("english_marks")%></td>
		</tr>

		<%
			
			}
			double averageScience = scienceTotal / (rowNumber);
			double averageMath = mathTotal / (rowNumber);
			double averageEnglish = englishTotal / (rowNumber);
			
		%>

		<br>
		<p>The average of Science marks is <%= averageScience %></p>
		<p>The average of Mathematics marks is <%= averageMath %></p>
		<p>The average of English marks is <%= averageEnglish %></p>
		
		<form method="get" action="addStudent.html">
			<input type="submit" value="Add Student">
		</form>
		
		
</body>
</html>