package blog_travel.controller.dao;

import java.util.List;

import blog_travel.controller.model.Category;

public interface ICommentDAO extends IGenericDAO<Category>{
	List<Category> findByPostID(int PostID);
}
