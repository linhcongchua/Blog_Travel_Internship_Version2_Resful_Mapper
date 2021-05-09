package blog_travel.service.impl;

import java.util.List;

import javax.inject.Inject;

import blog_travel.controller.dao.ICategoryDAO;
import blog_travel.controller.model.Category;
import blog_travel.service.ICategoryService;

public class CategoryService implements ICategoryService {
	@Inject
	private ICategoryDAO categoryDAO;

	@Override
	public List<Category> findAll() {
		return categoryDAO.findAll();
	}

}
