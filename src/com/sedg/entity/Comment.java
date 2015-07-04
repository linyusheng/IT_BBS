package com.sedg.entity;

import java.sql.Timestamp;

/**
 * Comment entity. @author MyEclipse Persistence Tools
 */

public class Comment implements java.io.Serializable {

	// Fields

	private Integer commentId;
	private User user;
	private Article article;
	private String commentInfo;
	private Timestamp commentTime;

	// Constructors

	/** default constructor */
	public Comment() {
	}

	/** full constructor */
	public Comment(User user, Article article, String commentInfo,
			Timestamp commentTime) {
		this.user = user;
		this.article = article;
		this.commentInfo = commentInfo;
		this.commentTime = commentTime;
	}

	// Property accessors

	public Integer getCommentId() {
		return this.commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Article getArticle() {
		return this.article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public String getCommentInfo() {
		return this.commentInfo;
	}

	public void setCommentInfo(String commentInfo) {
		this.commentInfo = commentInfo;
	}

	public Timestamp getCommentTime() {
		return this.commentTime;
	}

	public void setCommentTime(Timestamp commentTime) {
		this.commentTime = commentTime;
	}

}