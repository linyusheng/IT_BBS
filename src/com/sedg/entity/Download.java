package com.sedg.entity;

import java.sql.Timestamp;

/**
 * Download entity. @author MyEclipse Persistence Tools
 */

public class Download implements java.io.Serializable {

	// Fields

	private Integer downloadId;
	private Resource resource;
	private User user;
	private Timestamp downloadTime;

	// Constructors

	/** default constructor */
	public Download() {
	}

	/** full constructor */
	public Download(Resource resource, User user, Timestamp downloadTime) {
		this.resource = resource;
		this.user = user;
		this.downloadTime = downloadTime;
	}

	// Property accessors

	public Integer getDownloadId() {
		return this.downloadId;
	}

	public void setDownloadId(Integer downloadId) {
		this.downloadId = downloadId;
	}

	public Resource getResource() {
		return this.resource;
	}

	public void setResource(Resource resource) {
		this.resource = resource;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Timestamp getDownloadTime() {
		return this.downloadTime;
	}

	public void setDownloadTime(Timestamp downloadTime) {
		this.downloadTime = downloadTime;
	}

}