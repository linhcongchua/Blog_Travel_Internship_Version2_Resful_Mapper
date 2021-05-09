package blog_travel.service;

import java.util.List;

import blog_travel.controller.model.Pagging;
import blog_travel.controller.model.Post;

public interface IPostService {
	List<Post> getPostsByCategory(Integer CategoryID, Pagging pagging);
	List<Post> getTop3Posts();
	Post getPostByID(Integer postID);
	Pagging determindPagging(Pagging pagging,Integer cateID, int npip);
	Post insert(Post post);
	void updatePost(Post post);
}
