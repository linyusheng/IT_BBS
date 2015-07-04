package com.sedg.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Resource entity. @author MyEclipse Persistence Tools
 */

public class Resource implements java.io.Serializable {

	// Fields

	private Integer resourceId;
	private User user;
	private String resourceName;
	private String resourceType;
	private String resourcePath;
	private Integer itBean;
	private Integer downloadNum;
	private Integer downloadScore;
	private Timestamp uploadTime;
	private Set downloads = new HashSet(0);

	// Constructors

	/** default constructor */
	public Resource() {
	}

	/** full constructor */
	public Resource(User user, String resourceName, String resourceType,
			String resourcePath, Integer itBean, Integer downloadNum,
			Integer downloadScore, Timestamp uploadTime, Set downloads) {
		this.user = user;
		this.resourceName = resourceName;
		this.resourceType = resourceType;
		this.resourcePath = resourcePath;
		this.itBean = itBean;
		this.downloadNum = downloadNum;
		this.downloadScore = downloadScore;
		this.uploadTime = uploadTime;
		this.downloads = downloads;
	}

	// Property accessors

	public Integer getResourceId() {
		return this.resourceId;
	}

	public void setResourceId(Integer resourceId) {
		this.resourceId = resourceId;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getResourceName() {
		return this.resourceName;
	}

	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}

	public String getResourceType() {
		return this.resourceType;
	}

	public void setResourceType(String resourceType) {
		this.resourceType = resourceType;
	}

	public String getResourcePath() {
		return this.resourcePath;
	}

	public void setResourcePath(String resourcePath) {
		this.resourcePath = resourcePath;
	}

	public Integer getItBean() {
		return this.itBean;
	}

	public void setItBean(Integer itBean) {
		this.itBean = itBean;
	}

	public Integer getDownloadNum() {
		return this.downloadNum;
	}

	public void setDownloadNum(Integer downloadNum) {
		this.downloadNum = downloadNum;
	}

	public Integer getDownloadScore() {
		return this.downloadScore;
	}

	public void setDownloadScore(Integer downloadScore) {
		this.downloadScore = downloadScore;
	}

	public Timestamp getUploadTime() {
		return this.uploadTime;
	}

	public void setUploadTime(Timestamp uploadTime) {
		this.uploadTime = uploadTime;
	}

	public Set getDownloads() {
		return this.downloads;
	}

	public void setDownloads(Set downloads) {
		this.downloads = downloads;
	}

}