package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDAO;
import model.Account;

public class LoginController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	// make sure that email and pass are valid
	private boolean validateSyntax(String userName, String password) {
		// make sure that email is valid
		String regexMail = "^[A-Z0-9a-z]+@[A-Z0-9\\.a-z]+\\.[A-Za-z]{2,6}$";
		String regex = "[a-zA-Z0-9_!@#$%^&*]+";

		if (!password.matches(regex) || !userName.matches(regexMail)) {
			return false;
		}
		return true;
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getSession(true).invalidate();
		try {
			// collect data from a login form
			String username = req.getParameter("username");
			String passWord = req.getParameter("password");
			boolean remember = req.getParameter("remember") != null ? true : false;

			HttpSession session = req.getSession(true);
			// validate syntax
			if (!validateSyntax(username, passWord)) {
				session.setAttribute("error", "invalid syntax");
				resp.sendRedirect("login.jsp");
				return;
			}

			// check account
			AccountDAO db = new AccountDAO();
			Account acc = db.findAccount(username, passWord);
			// wrong username or password
			if (acc == null) {
				session.setAttribute("error", "wrong username or password");
				resp.sendRedirect("login.jsp");
			} else {
				// login success
				session.setAttribute("account", acc);
				// if user remember login
				if (remember) {
					Cookie auth = new Cookie("username", username);
					// set max age equals a week
					auth.setMaxAge(60 * 60 * 24 * 7);
					resp.addCookie(auth);
				}
				
				session.setAttribute("message", "hello " + acc.getDisplayName()+"!");
				// if admin login, redirect to admin servlet
				if(acc.isAdmin()) {
					resp.sendRedirect("admin");
					
				}else {
					// if user login is not admin, redirect to list servlet
					resp.sendRedirect("list");
				}
				
			}
		} catch (

		NullPointerException e) {
			resp.sendRedirect("login.jsp");
		} catch (Exception e) {
			resp.getWriter().println(e);
		}

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cookie[] cookies = req.getCookies();
		// check if user login before with remember me option checked
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("username")) {
					HttpSession session = req.getSession(true);
					session.setAttribute("username", cookie.getValue());
					// now redirect to index page of admin
					req.getRequestDispatcher("login.jsp").include(req, resp);
					return;
				}
			}
		}

		req.getRequestDispatcher("login.jsp").include(req, resp);
	}
}
