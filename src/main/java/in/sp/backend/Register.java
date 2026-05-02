package in.sp.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/regForm")
public class Register extends HttpServlet {
	@Override

	// HttpServletRequest->get data from user
	// HttpServletResponse->send data to user

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// printWriter-java class->It is used to print data (text/HTML) to browser
		PrintWriter out = resp.getWriter();
		// getWriter()method of httpServletResponse-->It gives you a way to send text
		// data to browser

		String myName = req.getParameter("name");// get parameter from jsp file
		String myEmail = req.getParameter("email");

		String myPass = req.getParameter("pass");

		String myGender = req.getParameter("gender");

		String myCity = req.getParameter("city");
		String myRole = req.getParameter("role");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/naykafashion", "root", "root");

			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO naykausers(name, email, password, gender, city,role) VALUES(?,?,?,?,?,?)");

			ps.setString(1, myName);
			ps.setString(2, myEmail);
			ps.setString(3, myPass);
			ps.setString(4, myGender);
			ps.setString(5, myCity);
			ps.setString(6, "user");

			int count = ps.executeUpdate();// it return integer result

			if (count > 0) {

				// redirect from register to login if sucess
				resp.sendRedirect("login.jsp");

			} else {
				resp.setContentType("text/html");
				out.print("<h3> user not register due to some error  </h3>");
				RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
				rd.include(req, resp);
			}

			con.close();

		} catch (Exception e) {
//			e.printStackTrace();
			resp.setContentType("text/html");
			out.print("<h3 style='color:red'> Exception occured: " + e.getMessage() + "</h3>");
			RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
			rd.include(req, resp);
		}
	}
}
