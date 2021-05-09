package blog_travel.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog_travel.controller.model.Category;
import blog_travel.controller.model.Post;
import blog_travel.service.ICategoryService;
import blog_travel.service.IPostService;

@WebServlet(urlPatterns = { "/admin-edit" })
public class EditController extends HttpServlet {
	@Inject
	private IPostService postService;

	@Inject
	ICategoryService categoryService;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		if (action.equalsIgnoreCase("edit-post")) {
			String postID_P = req.getParameter("postID");
			Integer postID = Integer.parseInt(postID_P);
			Post post = postService.getPostByID(postID);

			req.setAttribute("post", post);
		}
		
		List<Category> categories = categoryService.findAll();
		req.setAttribute("categories", categories);

		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/edit.jsp");
		rd.forward(req, resp);
	}
}
