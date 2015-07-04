package com.sedg.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Article entity. @author MyEclipse Persistence Tools
 */

public class Article implements java.io.Serializable {

	// Fields

	private Integer articleId;
	private User user;
	private String articleTitle;
	private String articleType;
	private String articleSort;
	private String articleInfo;
	private String articleReadNum;
	private String articleCommentNum;
	private String articlePraiseNum;
	private String articleLabel;
	private Timestamp writeTime;
	private Set collects = new HashSet(0);
	private Set comments = new HashSet(0);

	// Constructors

	/** default constructor */
	public Article() {
	}

	/** full constructor */
	public Article(User user, String articleTitle, String articleType,
			String articleSort, String articleInfo, String articleReadNum,
			String articleCommentNum, String articlePraiseNum,
			String articleLabel, Timestamp writeTime, Set collects, Set comments) {
		this.user = user;
		this.articleTitle = articleTitle;
		this.articleType = articleType;
		this.articleSort = articleSort;
		this.articleInfo = articleInfo;
		this.articleReadNum = articleReadNum;
		this.articleCommentNum = articleCommentNum;
		this.articlePraiseNum = articlePraiseNum;
		this.articleLabel = articleLabel;
		this.writeTime = writeTime;
		this.collects = collects;
		this.comments = comments;
	}

	// Property accessors

	public Integer getArticleId() {
		return this.articleId;
	}

	public void setArticleId(Integer articleId) {
		this.articleId = articleId;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getArticleTitle() {
		return this.articleTitle;
	}

	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}

	public String getArticleType() {
		return this.articleType;
	}

	public void setArticleType(String articleType) {
		this.articleType = articleType;
	}

	public String getArticleSort() {
		return this.articleSort;
	}

	public void setArticleSort(String articleSort) {
		this.articleSort = articleSort;
	}

	public String getArticleInfo() {
		return this.articleInfo;
	}

	public void setArticleInfo(String articleInfo) {
		this.articleInfo = articleInfo;
	}

	public String getArticleReadNum() {
		return this.articleReadNum;
	}

	public void setArticleReadNum(String articleReadNum) {
		this.articleReadNum = articleReadNum;
	}

	public String getArticleCommentNum() {
		return this.articleCommentNum;
	}

	public void setArticleCommentNum(String articleCommentNum) {
		this.articleCommentNum = articleCommentNum;
	}

	public String getArticlePraiseNum() {
		return this.articlePraiseNum;
	}

	public void setArticlePraiseNum(String articlePraiseNum) {
		this.articlePraiseNum = articlePraiseNum;
	}

	public String getArticleLabel() {
		return this.articleLabel;
	}

	public void setArticleLabel(String articleLabel) {
		this.articleLabel = articleLabel;
	}

	public Timestamp getWriteTime() {
		return this.writeTime;
	}

	public void setWriteTime(Timestamp writeTime) {
		this.writeTime = writeTime;
	}

	public Set getCollects() {
		return this.collects;
	}

	public void setCollects(Set collects) {
		this.collects = collects;
	}

	public Set getComments() {
		return this.comments;
	}

	public void setComments(Set comments) {
		this.comments = comments;
	}

}