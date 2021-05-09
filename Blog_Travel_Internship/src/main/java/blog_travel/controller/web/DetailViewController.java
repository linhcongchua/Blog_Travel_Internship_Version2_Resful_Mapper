package blog_travel.controller.web;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog_travel.controller.model.Post;
import blog_travel.service.IPostService;

@WebServlet(urlPatterns = { "/post-view" })
public class DetailViewController extends HttpServlet {
	@Inject
	private IPostService postService;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Post post = null;

		List<Post> top3 = postService.getTop3Posts();
		req.setAttribute("top3", top3);

		String postID_P = req.getParameter("postID");
		if (postID_P != null) {
			Integer postID = Integer.parseInt(postID_P);
			post = postService.getPostByID(postID);
		} else {
			post = top3 == null ? null : top3.isEmpty() ? null : top3.get(0);
		}
		req.setAttribute("post", post);
		RequestDispatcher rd = req.getRequestDispatcher("/views/detail.jsp");
		rd.forward(req, resp);
	}
}
