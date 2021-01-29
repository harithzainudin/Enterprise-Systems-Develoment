
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddServlet
 */
@WebServlet("/AddStudent")
public class addstudent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public addstudent() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String dept = request.getParameter("dept");
		String science = request.getParameter("science");
		String math = request.getParameter("math");
		String english = request.getParameter("english");
		try {

			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/db1?useTimezone=true&serverTimezone=UTC", "root", "V@nilla7");
			PreparedStatement stmt = conn.prepareStatement(
					"insert into student(id, name, department, science_marks, math_marks, english_marks) values (?,?,?,?,?,?)");
			stmt.setString(1, id);
			stmt.setString(2, name);
			stmt.setString(3, dept);
			stmt.setString(4, science);
			stmt.setString(5, math);
			stmt.setString(6, english);
			stmt.executeUpdate();
			response.sendRedirect("homepage.jsp");
		} catch (Exception e) {
			System.out.print(e);
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
