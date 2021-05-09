package blog_travel.controller.model;

import java.util.Date;

public class Comment {
	private Integer CommentID;
	private Integer AccountID;
	private String CommentContent;
	private Date CreatedDate;
	private Date ModifiedDate;
	public Integer getCommentID() {
		return CommentID;
	}
	public void setCommentID(Integer commentID) {
		CommentID = commentID;
	}
	public Integer getAccountID() {
		return AccountID;
	}
	public void setAccountID(Integer accountID) {
		AccountID = accountID;
	}
	public String getCommentContent() {
		return CommentContent;
	}
	public void setCommentContent(String commentContent) {
		CommentContent = commentContent;
	}
	public Date getCreatedDate() {
		return CreatedDate;
	}
	public void setCreatedDate(Date createdDate) {
		CreatedDate = createdDate;
	}
	public Date getModifiedDate() {
		return ModifiedDate;
	}
	public void setModifiedDate(Date modifiedDate) {
		ModifiedDate = modifiedDate;
	}
	
	
}
