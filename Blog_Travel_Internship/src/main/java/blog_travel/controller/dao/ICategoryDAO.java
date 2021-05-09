package blog_travel.controller.dao;

import java.util.List;

import blog_travel.controller.model.Category;

public interface ICategoryDAO extends IGenericDAO<Category>{
	Category findOne(Integer CategoryID);
	List<Category> findAll();
}
