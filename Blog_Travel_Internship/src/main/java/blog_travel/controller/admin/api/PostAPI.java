package blog_travel.controller.admin.api;

import java.io.IOException;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import blog_travel.controller.model.Account;
import blog_travel.controller.model.Post;
import blog_travel.service.IPostService;
import blog_travel.utils.HttpUtil;
import blog_travel.utils.SessionUtil;
@WebServlet(urlPatterns = {"/api-admin-post"})
public class PostAPI extends HttpServlet{
	@Inject
	private IPostService postService;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper=new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		Post post=HttpUtil.of(req.getReader()).toModel(Post.class);
		Account author=(Account)SessionUtil.getInstance().getValue(req, "USER");
		if(author==null) {//dang thu vi post day tu req ko co session
			author=new Account();
			author.setAccountID(1);
		}
		String thumbnail="fix CUng";
		post.setThumbnail(thumbnail);
		post.setAuthor(author);
		Post postInserted=postService.insert(post);
		mapper.writeValue(resp.getOutputStream(), postInserted);
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper mapper=new ObjectMapper();
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		Post post=HttpUtil.of(req.getReader()).toModel(Post.class);
		Account author=(Account)SessionUtil.getInstance().getValue(req, "USER");
		if(author==null) {//dang thu vi post day tu req ko co session
			author=new Account();
			author.setAccountID(1);
		}else {
			post.setAuthor(author);
		}
		String thumbnail="fix CUng";
		post.setThumbnail(thumbnail);
		post.setAuthor(author);
		postService.updatePost(post);
		
		mapper.writeValue(resp.getOutputStream(), post);
	}
}
