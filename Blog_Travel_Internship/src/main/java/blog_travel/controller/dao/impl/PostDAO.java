package blog_travel.controller.dao.impl;

import java.util.List;
import java.util.ResourceBundle;

import blog_travel.controller.dao.IPostDAO;
import blog_travel.controller.model.Pagging;
import blog_travel.controller.model.Post;
import blog_travel.mapper.PostMapper;

public class PostDAO extends GenericDAO<Post> implements IPostDAO {

	@Override
	public Post findOne(Integer PostID) {
		String sql = "SELECT * FROM Post WHERE PostID=?";
		List<Post> posts = query(sql, new PostMapper(), PostID);
		return posts.isEmpty() ? null : posts.get(0);
	}

	@Override
	public List<Post> findByCategoryID(Integer CategoryID, Pagging pagging) {
		String sql = "SELECT * FROM ( " + "SELECT ROW_NUMBER() " + "OVER(ORDER BY PostID ASC) as Number, "
				+ "* FROM Post  " + "WHERE CategoryID = ? and isActive=1 " + ") as DataSearch "
				+ "JOIN Category C ON DataSearch.CategoryID=C.CategoryID "
				+ "JOIN Account A ON DataSearch.AuthorID=A.AccountID "
				+"JOIN Role R ON R.RoleID=A.RoleID "
				+ "WHERE Number between ? and ?";
		List<Post> posts = query(sql, new PostMapper(), CategoryID, pagging.getFrom(), pagging.getTo());
		return posts;
	}

	@Override
	public Integer add(Post post) {
		String sql = "INSERT INTO Post(Title,ShortDes,PostContent,Thumbnail, CategoryID, AuthorID, CreatedDate,isActive)"
				+ " VALUES(?,?,?,?,?,?,?,1)";
		System.out.println(post);
		return insert(sql, post.getTitle(), post.getShortDes(), post.getPostContent(), post.getThumbnail(),
				post.getCategory().getCategoryID(), post.getAuthor().getAccountID(), post.getCreatedDate());
	}

	@Override
	public void update(Post post) {
		String sql = "UPDATE Post SET Title=?, ShortDes=?, PostContent=?"
				+ ", Thumbnail=?, CategoryID=?, ModifiedDate=? WHERE PostID=?";
		update(sql, post.getTitle(), post.getShortDes(), post.getPostContent(), post.getThumbnail(),
				post.getCategoryID(), post.getModifiedDate(), post.getPostID());

	}

	@Override
	public void delete(Integer PostID) {
		// TODO Auto-generated method stub
		String sql = "UPDATE Post SET isActive=0 WHERE PostID=?";
		update(sql, PostID);
	}

	@Override
	public List<Post> getTop3Post() {
		String sql="SELECT TOP 3 * FROM Post WHERE isActive=1 ORDER BY CreatedDate DESC";
		return query(sql, new PostMapper());
	}

	@Override
	public int getTotalNumberPost(Integer cateID) {
		String sql="SELECT COUNT(*) number FROM Post WHERE CategoryID=?";
		return count(sql, cateID);
	}
	
}
