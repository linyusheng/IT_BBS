package com.sedg.entity;

import java.sql.Timestamp;

/**
 * Reply entity. @author MyEclipse Persistence Tools
 */

public class Reply implements java.io.Serializable {

	// Fields

	private Integer replyId;
	private User user;
	private Post post;
	private String replyInfo;
	private Timestamp replyTime;

	// Constructors

	/** default constructor */
	public Reply() {
	}

	/** full constructor */
	public Reply(User user, Post post, String replyInfo, Timestamp replyTime) {
		this.user = user;
		this.post = post;
		this.replyInfo = replyInfo;
		this.replyTime = replyTime;
	}

	// Property accessors

	public Integer getReplyId() {
		return this.replyId;
	}

	public void setReplyId(Integer replyId) {
		this.replyId = replyId;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Post getPost() {
		return this.post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public String getReplyInfo() {
		return this.replyInfo;
	}

	public void setReplyInfo(String replyInfo) {
		this.replyInfo = replyInfo;
	}

	public Timestamp getReplyTime() {
		return this.replyTime;
	}

	public void setReplyTime(Timestamp replyTime) {
		this.replyTime = replyTime;
	}

}