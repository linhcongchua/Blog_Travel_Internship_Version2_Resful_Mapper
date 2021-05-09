package blog_travel.controller.dao;

import java.util.List;

import blog_travel.controller.model.Pagging;
import blog_travel.controller.model.Post;

public interface IPostDAO extends IGenericDAO<Post>{
	Post findOne(Integer PostID);
	List<Post> findByCategoryID(Integer CategoryID,Pagging pagging);
	List<Post> getTop3Post();
	Integer add(Post post);
	void update(Post post);
	void delete(Integer PostID);
	int getTotalNumberPost(Integer cateID);
}
