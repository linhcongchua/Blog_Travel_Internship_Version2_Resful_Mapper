package blog_travel.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog_travel.controller.model.Account;
import blog_travel.utils.SessionUtil;

public class AuthorizationFilter implements Filter{
	private ServletContext context;
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		this.context=filterConfig.getServletContext();
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest) request;
		HttpServletResponse resp=(HttpServletResponse) response;
		
		String url=req.getRequestURI();
		System.out.println("URL: "+url);
		System.out.println("Context Path: "+req.getContextPath());
		if(url.startsWith(req.getContextPath()+"/admin")) {
			Account user=(Account) SessionUtil.getInstance().getValue(req, "USER");
			if(user!=null) {
				if(user.getRolename().equalsIgnoreCase("admin")) {
					chain.doFilter(request, response);
				}else if(user.getRolename().equalsIgnoreCase("user")) {
					resp.sendRedirect(req.getContextPath()+"/dang-nhap?action=login&message=not_permission");
				}
			}else {
				resp.sendRedirect(req.getContextPath()+"/dang-nhap?action=login&message=not_login");
			}
		}else {
			chain.doFilter(request, response);
		}
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
