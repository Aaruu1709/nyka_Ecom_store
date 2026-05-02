package in.sp.backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateProduct")
public class UpdateProduct extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		double price = Double.parseDouble(req.getParameter("price"));
		String desc = req.getParameter("description");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/naykafashion", "root", "root");

			PreparedStatement ps = con
					.prepareStatement("UPDATE products SET name=?, price=?, description=? WHERE id=?");

			ps.setString(1, name);
			ps.setDouble(2, price);
			ps.setString(3, desc);
			ps.setInt(4, id);

			ps.executeUpdate();

			resp.sendRedirect("viewProducts.jsp");

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
