package com.sedg.entity;

import java.sql.Timestamp;

/**
 * Sort entity. @author MyEclipse Persistence Tools
 */

public class Sort implements java.io.Serializable {

	// Fields

	private Integer sortId;
	private User user;
	private String sortName;
	private Integer articleNum;
	private Timestamp createTime;

	// Constructors

	/** default constructor */
	public Sort() {
	}

	/** full constructor */
	public Sort(User user, String sortName, Integer articleNum,
			Timestamp createTime) {
		this.user = user;
		this.sortName = sortName;
		this.articleNum = articleNum;
		this.createTime = createTime;
	}

	// Property accessors

	public Integer getSortId() {
		return this.sortId;
	}

	public void setSortId(Integer sortId) {
		this.sortId = sortId;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getSortName() {
		return this.sortName;
	}

	public void setSortName(String sortName) {
		this.sortName = sortName;
	}

	public Integer getArticleNum() {
		return this.articleNum;
	}

	public void setArticleNum(Integer articleNum) {
		this.articleNum = articleNum;
	}

	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

}