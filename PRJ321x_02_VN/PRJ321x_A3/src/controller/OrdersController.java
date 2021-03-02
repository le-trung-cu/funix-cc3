package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrdersDAO;
import model.Orders;

public class OrdersController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int orderId = Integer.parseInt(req.getParameter("id"));
		OrdersDAO db = new OrdersDAO();
		try {
			Orders order = db.getOrder(orderId);
			req.setAttribute("order", order);
			req.getRequestDispatcher("orders.jsp").forward(req, resp);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}
}
