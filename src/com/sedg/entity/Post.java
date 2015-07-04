package com.sedg.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Post entity. @author MyEclipse Persistence Tools
 */

public class Post implements java.io.Serializable {

	// Fields

	private Integer postId;
	private User user;
	private String postName;
	private String postInfo;
	private Integer answerNum;
	private Integer postPraiseNum;
	private Integer postReadNum;
	private String postStatus;
	private Timestamp postTime;
	private Integer praiseBean;
	private Set replies = new HashSet(0);

	// Constructors

	/** default constructor */
	public Post() {
	}

	/** full constructor */
	public Post(User user, String postName, String postInfo, Integer answerNum,
			Integer postPraiseNum, Integer postReadNum, String postStatus,
			Timestamp postTime, Integer praiseBean, Set replies) {
		this.user = user;
		this.postName = postName;
		this.postInfo = postInfo;
		this.answerNum = answerNum;
		this.postPraiseNum = postPraiseNum;
		this.postReadNum = postReadNum;
		this.postStatus = postStatus;
		this.postTime = postTime;
		this.praiseBean = praiseBean;
		this.replies = replies;
	}

	// Property accessors

	public Integer getPostId() {
		return this.postId;
	}

	public void setPostId(Integer postId) {
		this.postId = postId;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getPostName() {
		return this.postName;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}

	public String getPostInfo() {
		return this.postInfo;
	}

	public void setPostInfo(String postInfo) {
		this.postInfo = postInfo;
	}

	public Integer getAnswerNum() {
		return this.answerNum;
	}

	public void setAnswerNum(Integer answerNum) {
		this.answerNum = answerNum;
	}

	public Integer getPostPraiseNum() {
		return this.postPraiseNum;
	}

	public void setPostPraiseNum(Integer postPraiseNum) {
		this.postPraiseNum = postPraiseNum;
	}

	public Integer getPostReadNum() {
		return this.postReadNum;
	}

	public void setPostReadNum(Integer postReadNum) {
		this.postReadNum = postReadNum;
	}

	public String getPostStatus() {
		return this.postStatus;
	}

	public void setPostStatus(String postStatus) {
		this.postStatus = postStatus;
	}

	public Timestamp getPostTime() {
		return this.postTime;
	}

	public void setPostTime(Timestamp postTime) {
		this.postTime = postTime;
	}

	public Integer getPraiseBean() {
		return this.praiseBean;
	}

	public void setPraiseBean(Integer praiseBean) {
		this.praiseBean = praiseBean;
	}

	public Set getReplies() {
		return this.replies;
	}

	public void setReplies(Set replies) {
		this.replies = replies;
	}

}