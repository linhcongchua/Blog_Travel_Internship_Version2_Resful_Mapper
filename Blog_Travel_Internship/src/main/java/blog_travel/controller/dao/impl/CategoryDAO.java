package blog_travel.controller.dao.impl;

import java.util.List;

import blog_travel.controller.dao.ICategoryDAO;
import blog_travel.controller.model.Category;
import blog_travel.mapper.CategoryMapper;

public class CategoryDAO extends GenericDAO<Category> implements ICategoryDAO {

	@Override
	public Category findOne(Integer CategoryID) {
		String sql = "SELECT * FROM Category WHERE CategoryID=?";
		List<Category> categories = query(sql, new CategoryMapper(), CategoryID);
		return categories == null ? null : categories.isEmpty() ? null : categories.get(0);
	}

	@Override
	public List<Category> findAll() {
		String sql = "SELECT * FROM Category";
		return query(sql, new CategoryMapper());
	}

}
