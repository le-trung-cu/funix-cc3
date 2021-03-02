package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrdersDAO;
import model.Cart;
import model.Orders;

public class PayController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession(true);
			
			if(session.getAttribute("cart") == null) {
				session.setAttribute("cart", new Cart());
			}
			Cart c = (Cart) session.getAttribute("cart");
			
			OrdersDAO dao = new OrdersDAO();
			String username = req.getParameter("name");
			String discount = req.getParameter("discount");
			String address  = req.getParameter("address");
			Orders d = new Orders(address, username, discount);
			
			int orderId = dao.insertOrder(d, c);
			
			session.setAttribute("cart", new Cart());
			
			resp.sendRedirect(req.getContextPath()+"/orders?id="+orderId);
			
			
		} catch (Exception e) {
			resp.getWriter().println(e);
			e.printStackTrace();
		}
	}
}
