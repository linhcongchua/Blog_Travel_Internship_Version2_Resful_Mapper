package blog_travel.controller.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog_travel.controller.model.Account;
import blog_travel.controller.model.Pagging;
import blog_travel.controller.model.Post;
import blog_travel.service.IAccountService;
import blog_travel.service.IPostService;
import blog_travel.service.impl.AccountService;
import blog_travel.utils.FormUtil;

@WebServlet(urlPatterns = { "/adu-adu" })
public class adu extends HttpServlet {
	@Inject
	private IAccountService accountService;
	@Inject
	IPostService postService;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String username = "admin";
//		String password = "123456";
//		PrintWriter out = resp.getWriter();
//		Account acc = accountService.findByUsernameAndPassword(username, password);
//		if (acc == null) {
//			out.write("hi no null");
//		}else {
//			out.write(acc.getFullname());
//		}
		String cate=req.getParameter("categoryID");
		if(cate==null) {
			cate="1";
		}
		Integer CategoryID=Integer.parseInt(cate);
		Pagging pagging=FormUtil.toModel(Pagging.class, req);
		List<Post> posts=postService.getPostsByCategory(CategoryID, pagging);
		System.out.println("SIZE: "+posts.size());
		for (Post post : posts) {
			System.out.println(post.getCategory()+"\t");
		}
	}
		
}
