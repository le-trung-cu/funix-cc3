package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ListProductDAO;
import model.Cart;
import model.Product;

public class AddToCartController extends HttpServlet{
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession(true);
			int id = Integer.parseInt(req.getParameter("id"));
			String acction = req.getParameter("action");
			if(acction == null) {
				return;
			}
			if(session.getAttribute("cart") == null) {
				session.setAttribute("cart", new Cart());
			}
			
			Cart c = (Cart) session.getAttribute("cart");
			
			if(acction.equalsIgnoreCase("add")) {
				Product p = new ListProductDAO().getProduct(id);
				p.setNumber(1);
				c.add(p);
			}else if (acction.equalsIgnoreCase("delete")){
				c.remove(id);
			}else if(acction.equalsIgnoreCase("subtract")) {
				Product p = new ListProductDAO().getProduct(id);
				c.subtract(p);
			}
			
			resp.sendRedirect(req.getContextPath()+"/checkout.jsp");
		}catch(Exception e) {
			resp.getWriter().println(e);
		}
	}
}
