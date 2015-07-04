package com.sedg.entity;

import java.sql.Timestamp;

/**
 * Photo entity. @author MyEclipse Persistence Tools
 */

public class Photo implements java.io.Serializable {

	// Fields

	private Integer pictureId;
	private User user;
	private String pictureName;
	private String pictureUrl;
	private String pictureDescription;
	private Timestamp pictureUploadTime;

	// Constructors

	/** default constructor */
	public Photo() {
	}

	/** full constructor */
	public Photo(User user, String pictureName, String pictureUrl,
			String pictureDescription, Timestamp pictureUploadTime) {
		this.user = user;
		this.pictureName = pictureName;
		this.pictureUrl = pictureUrl;
		this.pictureDescription = pictureDescription;
		this.pictureUploadTime = pictureUploadTime;
	}

	// Property accessors

	public Integer getPictureId() {
		return this.pictureId;
	}

	public void setPictureId(Integer pictureId) {
		this.pictureId = pictureId;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getPictureName() {
		return this.pictureName;
	}

	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
	}

	public String getPictureUrl() {
		return this.pictureUrl;
	}

	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}

	public String getPictureDescription() {
		return this.pictureDescription;
	}

	public void setPictureDescription(String pictureDescription) {
		this.pictureDescription = pictureDescription;
	}

	public Timestamp getPictureUploadTime() {
		return this.pictureUploadTime;
	}

	public void setPictureUploadTime(Timestamp pictureUploadTime) {
		this.pictureUploadTime = pictureUploadTime;
	}

}