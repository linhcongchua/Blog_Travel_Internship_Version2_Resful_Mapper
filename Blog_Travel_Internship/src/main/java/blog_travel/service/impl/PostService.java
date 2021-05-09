package blog_travel.service.impl;

import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;

import javax.inject.Inject;

import blog_travel.controller.dao.ICategoryDAO;
import blog_travel.controller.dao.IPostDAO;
import blog_travel.controller.model.Category;
import blog_travel.controller.model.Pagging;
import blog_travel.controller.model.Post;
import blog_travel.service.IPostService;

public class PostService implements IPostService {
	@Inject
	private IPostDAO postDAO;
	@Inject
	private ICategoryDAO cateDAO;

	@Override
	public List<Post> getPostsByCategory(Integer CategoryID, Pagging pagging) {
		return postDAO.findByCategoryID(CategoryID, pagging);
	}

	@Override
	public Post getPostByID(Integer postID) {
		return postDAO.findOne(postID);
	}

	@Override
	public List<Post> getTop3Posts() {
		return postDAO.getTop3Post();
	}

	@Override
	public Post insert(Post post) {
		post.setCreatedDate(new Date());
		Category cate = cateDAO.findOne(post.getCategoryID());
		post.setCategory(cate);

		Integer postID = postDAO.add(post);
		return postDAO.findOne(postID);
	}

	@Override
	public void updatePost(Post post) {
		post.setModifiedDate(new Date());

		postDAO.update(post);
	}

	@Override
	public Pagging determindPagging(Pagging pagging, Integer cateID, int npip) {
		Pagging newPagging = new Pagging();

		newPagging.setNumberPostInPage(npip);

		int numberPost = postDAO.getTotalNumberPost(cateID);
		int numberPage = (numberPost % npip == 0) ? (numberPost / npip) : (numberPost / npip + 1);

		newPagging.setPageCurrent(pagging.getPageCurrent() == null ? 1 : pagging.getPageCurrent());
		newPagging.setNumberPage(numberPage);
		newPagging.setNumberPostInPage(npip);
		return newPagging;
	}

}
