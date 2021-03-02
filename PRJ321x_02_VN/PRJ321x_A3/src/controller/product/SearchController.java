package controller.product;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ListProductDAO;
import model.Pagination;
import model.Product;

public class SearchController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String page = req.getParameter("page");
			String nameProduct = req.getParameter("search");
			String brand = req.getParameter("brand");

			int nPage = 1;
			if (page != null) {
				nPage = Integer.parseInt(page);
			}
			Pagination<Product> ls = new ListProductDAO().search(nameProduct, brand, nPage, 8);
			if (brand != null && !brand.isBlank()) {
				req.setAttribute("brand", brand);
			}

			if (nameProduct != null && !nameProduct.isBlank()) {
				req.setAttribute("search", nameProduct);
			}

			req.setAttribute("pProduct", ls);
			req.getRequestDispatcher("list.jsp").forward(req, resp);
		} catch (SQLException e) {
			Logger.getLogger(ListController.class.getName()).log(Level.SEVERE, null, e);
		}

	}
}
