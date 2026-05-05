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

		// In Java (JDBC), DriverManager is a class used to manage database drivers and
		// establish a connection to the database.
		// it connects your Java application to the database.
		// It automatically selects the appropriate database driver.
		// The method getConnection() returns a👉 Connection object
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
//			Class.forName(...)
//		It is used to load a class into memory at runtime.
//			It belongs to the Class class in Java.
//			It is commonly used in JDBC to load the database driver.
//			When the class loads, its static block registers the driver automatically.	

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/naykafashion", "root", "root");
//👉 Without con, Java doesn’t know which database to run the query on

			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO naykausers(name, email, password, gender, city,role) VALUES(?,?,?,?,?,?)");
//👉 You must call first (connection) before placing an order (query)

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

//Class is a built-in Java class in java.lang package.
//It represents metadata (information) of a class at runtime.
//It is part of reflection API (used to inspect classes dynamically).
//It allows operations like load

//🔹 About forName() –
//It is a static method of the Class class.
//It takes fully qualified class name (String) as input.
//It loads and initializes the class into JVM memory.
//It throws ClassNotFoundException if class is not found.
