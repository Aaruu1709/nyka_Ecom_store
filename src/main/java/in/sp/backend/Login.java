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

@WebServlet("/loginForm") // this request come from login jsp page
public class Login extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();

		String myEmail = req.getParameter("email");
		String myPass = req.getParameter("pass"); // for admin => FIXED which i provided in mysql db

		// connection to DB
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/naykafashion", "root", "root");

			PreparedStatement ps = con.prepareStatement("SELECT * FROM naykausers WHERE email=? AND password=?");// here
																													// i
																													// used
																													// positional
																													// parameter
																													// instedd
																													// of
																													// default
																													// value

			ps.setString(1, myEmail);
			ps.setString(2, myPass);
			System.out.println(myEmail + " " + myPass);// print in console to test output

			ResultSet rs = ps.executeQuery();// executeQuery for select only rather than this for edit delete we use
												// executeUpdate() methos of preparedStatement

			if (rs.next()) {
				// next is method of ResultSet to check is there any update on table in db

				HttpSession session = req.getSession();
				// Http is stateless -> server forget user data after each request
				// HttpSession keeps user data available on other pages
				// session remember user on other pages

				// req.getSession()=>check if session already exists
				// if not, cretes new session and return HttpSession object
				// methods setAttribute()=> store data
				// getAttribute()=> get Data
				// removeAttribute()=>remove data
				// invalidate()=> destroy session/logout

				String name = rs.getString("name");
				String role = rs.getString("role");

				session.setAttribute("name", name);// store session data
				session.setAttribute("role", role);

				// Role-based redirection
				if ("admin".equals(role)) {
					resp.sendRedirect("admin.jsp");// if role is admin then redirect to admin.jsp page else home.jsp or
													// same
				} else {
					resp.sendRedirect("home.jsp");
				}

			} else {
				out.print("<h3>Email and password did not match</h3>");
				RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
				rd.include(req, resp);
			}

			con.close(); // to close connection

		} catch (Exception e) {
			out.print("<h3>Error occurred: " + e.getMessage() + "</h3>");
			RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
			rd.include(req, resp);
		}
	}
}

//methods of HttpServletRequest(req)
/*--
 * getParameter()=> get form data
 * getParameterValue()=>get multiple values
 * getAttribute()=>get server-side attribute
 * setAttribute()=>store Attribute
 * getSession()=> create/get session
 * getCookies()=> get cookies
 * getHeader()=>get request Header
 * getMethod()=> get or post
 * getRequestURI()=>get url path
 * getContextPath()=>getProjectpath
 * 
 * methods of HttpServletResponse(res)
 * res object is used to send response to browser
 * getWriter()=> send text output
 * sendRedirect()=> redirect to another page
 * setContentType()=>set response type
 * addCoockies()=> add cookie
 * setHeader()=> set response header
 * setError()=> send error message
 * --*/
