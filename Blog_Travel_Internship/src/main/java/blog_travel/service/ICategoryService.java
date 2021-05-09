package blog_travel.service;

import java.util.List;

import blog_travel.controller.model.Category;

public interface ICategoryService {
	List<Category> findAll();
}
