package blog_travel.controller.web;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog_travel.controller.model.Category;
import blog_travel.controller.model.Pagging;
import blog_travel.controller.model.Post;
import blog_travel.service.ICategoryService;
import blog_travel.service.IPostService;
import blog_travel.utils.FormUtil;

@WebServlet(urlPatterns = {"/list-view"})
public class ListViewController extends HttpServlet {
	@Inject
	IPostService postService;

	@Inject
	ICategoryService categoryService;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ServletContext context = getServletContext();
		int npip=(int) context.getAttribute("npip");
		String cate = req.getParameter("categoryID");
		if (cate == null) {
			cate = "1";
		}
		Integer CategoryID = Integer.parseInt(cate);
		Pagging pagging = FormUtil.toModel(Pagging.class, req);
		Pagging newPagging=postService.determindPagging(pagging, CategoryID, npip);
		
		List<Post> posts = postService.getPostsByCategory(CategoryID, newPagging);
		req.setAttribute("posts", posts);
		
		List<Post> top3=postService.getTop3Posts();
		req.setAttribute("top3", top3);

		List<Category> categories = categoryService.findAll();
		req.setAttribute("categories", categories);

		RequestDispatcher rd = req.getRequestDispatcher("/views/web/list.jsp");
		rd.forward(req, resp);
	}
}
