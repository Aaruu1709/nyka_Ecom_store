package in.sp.backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import in.sp.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addProduct")
public class AddProduct extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 1. Get data from JSP
		String name = req.getParameter("name");
		double price = Double.parseDouble(req.getParameter("price"));
		String description = req.getParameter("description");
		String image = req.getParameter("image");
		System.out.println(image);

		try {
			// 2. Load driver
			Class.forName("com.mysql.cj.jdbc.Driver");

			// 3. Create connection
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/naykafashion", "root", "root");

			// 4. Create Product object (Model usage)
			Product p = new Product();
			p.setName(name);
			p.setPrice(price);
			p.setDescription(description);
			p.setImage(image);

			// 5. Insert into DB
			PreparedStatement ps = con
					.prepareStatement("INSERT INTO products(name, price, description,image) VALUES(?,?,?,?)");

			ps.setString(1, p.getName());
			ps.setDouble(2, p.getPrice());
			ps.setString(3, p.getDescription());
			ps.setString(4, p.getImage());

			int count = ps.executeUpdate();

			// 6. Redirect
			if (count > 0) {
				resp.sendRedirect("admin.jsp?msg=Product Added Successfully");
			} else {
				resp.sendRedirect("addProduct.jsp?msg=Error");
			}

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect("addProduct.jsp?msg=Exception");
		}
	}
}
