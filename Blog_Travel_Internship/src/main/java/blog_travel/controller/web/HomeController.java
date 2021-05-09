package blog_travel.controller.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog_travel.controller.dao.impl.AccountDAO;
import blog_travel.controller.dao.impl.GenericDAO;
import blog_travel.controller.model.Account;
import blog_travel.service.IAccountService;
import blog_travel.utils.FormUtil;
import blog_travel.utils.SessionUtil;

@WebServlet(urlPatterns = { "/trang-chu", "/dang-nhap", "/thoat" })
public class HomeController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Inject
	private IAccountService accountService;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		if (action == null) {
			RequestDispatcher rd = req.getRequestDispatcher("/views/web/home.jsp");
			rd.forward(req, resp);
		} else if (action.equalsIgnoreCase("login")) {
			String message=req.getParameter("message");
			if(message!=null) {
				req.setAttribute("invalid", message);
			}
			RequestDispatcher rd = req.getRequestDispatcher("/views/login.jsp");
			rd.forward(req, resp);
		}else if(action.equalsIgnoreCase("logout")) {
			SessionUtil.getInstance().removeValue(req, "USER");
			RequestDispatcher rd = req.getRequestDispatcher("/views/web/home.jsp");
			rd.forward(req, resp);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 String action = req.getParameter("action");
		if (action != null && action.equalsIgnoreCase("login")) {
			Account account = FormUtil.toModel(Account.class, req);
			
			Account accountReal = accountService.findByUsernameAndPassword(account.getUsername(),
					account.getPassword());
			if (accountReal != null) {
				SessionUtil sessionUtil = SessionUtil.getInstance();
				sessionUtil.putValue(req, "USER", accountReal);
				if(accountReal.getRolename().equalsIgnoreCase("admin")) {
					resp.sendRedirect(req.getContextPath()+"/admin-home");
				}else if(accountReal.getRolename().equalsIgnoreCase("user")){
					resp.sendRedirect(req.getContextPath()+"/trang-chu");
				}
			} else {
				resp.sendRedirect(req.getContextPath() + "/dang-nhap?action=login&message=username_password_invalid");
			}
		}
		
//		PrintWriter out = resp.getWriter();
//		Account acc = FormUtil.toModel(Account.class, req);
//		out.write("User: " + acc.getUsername() + "<br/>Pass: " + acc.getPassword());
//		Account accountReal = accountService.findByUsernameAndPassword(acc.getUsername(),
//				acc.getPassword());
//		out.write(" UserReal: " + accountReal.getUsername() + "<br/>PassReal: " + accountReal.getPassword());
		
		
	}
}
