package blog_travel.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import blog_travel.controller.model.Account;
import blog_travel.controller.model.Category;
import blog_travel.controller.model.Post;

public class PostMapper implements IRowMapper<Post>{

	public Post mapRow(ResultSet rs) {
		AccountMapper accountMapper=new AccountMapper();
		CategoryMapper categoryMapper=new CategoryMapper();
		Post post=new Post();
		
		try {
			post.setPostID(rs.getInt("postID"));
			post.setTitle(rs.getString("title"));
			post.setShortDes(rs.getString("shortDes"));
			post.setPostContent(rs.getString("postContent"));;
			post.setThumbnail(rs.getString("thumbnail"));
			
			//set account
			Account account=accountMapper.mapRow(rs);
			post.setAuthor(account);
			//set category
			Category category=categoryMapper.mapRow(rs);
			post.setCategory(category);
			
			post.setCreatedDate(rs.getDate("createdDate"));
			post.setModifiedDate(rs.getDate("modifiedDate"));
			
		}catch (SQLException e) {
			return null;
		}
		return post;
	}

}
