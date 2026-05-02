package in.sp.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/loginForm")
public class Login extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();

		String myEmail = req.getParameter("email");
		String myPass = req.getParameter("pass"); // ✅ FIXED

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/naykafashion", "root", "root");

			PreparedStatement ps = con.prepareStatement("SELECT * FROM naykausers WHERE email=? AND password=?");

			ps.setString(1, myEmail);
			ps.setString(2, myPass);
			System.out.println(myEmail + " " + myPass);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				HttpSession session = req.getSession();

				String name = rs.getString("name");
				String role = rs.getString("role");

				session.setAttribute("name", name);
				session.setAttribute("role", role);

				// Role-based redirection
				if ("admin".equals(role)) {
					resp.sendRedirect("admin.jsp");
				} else {
					resp.sendRedirect("home.jsp");
				}

			} else {
				out.print("<h3>Email and password did not match</h3>");
				RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
				rd.include(req, resp);
			}

			con.close(); // ✅ added

		} catch (Exception e) {
			out.print("<h3>Error occurred: " + e.getMessage() + "</h3>");
			RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
			rd.include(req, resp);
		}
	}
}
