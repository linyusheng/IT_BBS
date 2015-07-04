package com.sedg.entity;

import java.sql.Timestamp;

/**
 * Score entity. @author MyEclipse Persistence Tools
 */

public class Score implements java.io.Serializable {

	// Fields

	private Integer scoreId;
	private User user;
	private String changeContent;
	private String itbeanChange;
	private String scoreChange;
	private Timestamp changeTime;

	// Constructors

	/** default constructor */
	public Score() {
	}

	/** full constructor */
	public Score(User user, String changeContent, String itbeanChange,
			String scoreChange, Timestamp changeTime) {
		this.user = user;
		this.changeContent = changeContent;
		this.itbeanChange = itbeanChange;
		this.scoreChange = scoreChange;
		this.changeTime = changeTime;
	}

	// Property accessors

	public Integer getScoreId() {
		return this.scoreId;
	}

	public void setScoreId(Integer scoreId) {
		this.scoreId = scoreId;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getChangeContent() {
		return this.changeContent;
	}

	public void setChangeContent(String changeContent) {
		this.changeContent = changeContent;
	}

	public String getItbeanChange() {
		return this.itbeanChange;
	}

	public void setItbeanChange(String itbeanChange) {
		this.itbeanChange = itbeanChange;
	}

	public String getScoreChange() {
		return this.scoreChange;
	}

	public void setScoreChange(String scoreChange) {
		this.scoreChange = scoreChange;
	}

	public Timestamp getChangeTime() {
		return this.changeTime;
	}

	public void setChangeTime(Timestamp changeTime) {
		this.changeTime = changeTime;
	}

}