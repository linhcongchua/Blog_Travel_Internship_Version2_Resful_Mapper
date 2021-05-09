package blog_travel.controller.dao;

import java.util.List;

import blog_travel.mapper.IRowMapper;

public interface IGenericDAO<T> {
	<T> List<T> query(String sql, IRowMapper<T> rowMapper,Object... parameters);
	Integer insert(String sql, Object...parameters);
	void update(String sql, Object...parameters);
	int count(String sql, Object...parameters);
}
