package com.sedg.entity;

import java.sql.Timestamp;

/**
 * Collect entity. @author MyEclipse Persistence Tools
 */

public class Collect implements java.io.Serializable {

	// Fields

	private Integer collectId;
	private User user;
	private Article article;
	private Timestamp collectTime;
	private String collectExplain;

	// Constructors

	/** default constructor */
	public Collect() {
	}

	/** full constructor */
	public Collect(User user, Article article, Timestamp collectTime,
			String collectExplain) {
		this.user = user;
		this.article = article;
		this.collectTime = collectTime;
		this.collectExplain = collectExplain;
	}

	// Property accessors

	public Integer getCollectId() {
		return this.collectId;
	}

	public void setCollectId(Integer collectId) {
		this.collectId = collectId;
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

	public Timestamp getCollectTime() {
		return this.collectTime;
	}

	public void setCollectTime(Timestamp collectTime) {
		this.collectTime = collectTime;
	}

	public String getCollectExplain() {
		return this.collectExplain;
	}

	public void setCollectExplain(String collectExplain) {
		this.collectExplain = collectExplain;
	}

}