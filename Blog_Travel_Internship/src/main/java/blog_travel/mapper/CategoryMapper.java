package blog_travel.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import blog_travel.controller.model.Category;

public class CategoryMapper implements IRowMapper<Category> {

	public Category mapRow(ResultSet rs) {
		Category category = new Category();
		try {
			category.setCategoryID(rs.getInt("categoryID"));
			category.setCategoryName(rs.getString("categoryName"));
			category.setCategoryDes(rs.getString("categoryDes"));
		} catch (SQLException e) {
			return null;
		}
		return category;
	}
}
