package com.sedg.entity;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private Integer userId;
	private String userName;
	private String password;
	private String userType;
	private String sex;
	private String photo;
	private String nickName;
	private String address;
	private String email;
	private Integer rank;
	private Integer score;
	private Integer userReadNum;
	private Integer itbeanNum;
	private Integer articleNumber;
	private Integer messageNumber;
	private Timestamp lastLoginTime;
	private Timestamp registerTime;
	private String signature;
	private Date birthday;
	private String qq;
	private String hobby;
	private String position;
	private String industry;
	private String workAge;
	private String income;
	private String introduction;
	private String maritalStatus;
	private Set collects = new HashSet(0);
	private Set posts = new HashSet(0);
	private Set photos = new HashSet(0);
	private Set downloads = new HashSet(0);
	private Set resources = new HashSet(0);
	private Set replies = new HashSet(0);
	private Set sorts = new HashSet(0);
	private Set scores = new HashSet(0);
	private Set comments = new HashSet(0);
	private Set articles = new HashSet(0);

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String userName, String password, String userType) {
		this.userName = userName;
		this.password = password;
		this.userType = userType;
	}

	/** full constructor */
	public User(String userName, String password, String userType, String sex,
			String photo, String nickName, String address, String email,
			Integer rank, Integer score, Integer userReadNum,
			Integer itbeanNum, Integer articleNumber, Integer messageNumber,
			Timestamp lastLoginTime, Timestamp registerTime, String signature,
			Date birthday, String qq, String hobby, String position,
			String industry, String workAge, String income,
			String introduction, String maritalStatus, Set collects, Set posts,
			Set photos, Set downloads, Set resources, Set replies, Set sorts,
			Set scores, Set comments, Set articles) {
		this.userName = userName;
		this.password = password;
		this.userType = userType;
		this.sex = sex;
		this.photo = photo;
		this.nickName = nickName;
		this.address = address;
		this.email = email;
		this.rank = rank;
		this.score = score;
		this.userReadNum = userReadNum;
		this.itbeanNum = itbeanNum;
		this.articleNumber = articleNumber;
		this.messageNumber = messageNumber;
		this.lastLoginTime = lastLoginTime;
		this.registerTime = registerTime;
		this.signature = signature;
		this.birthday = birthday;
		this.qq = qq;
		this.hobby = hobby;
		this.position = position;
		this.industry = industry;
		this.workAge = workAge;
		this.income = income;
		this.introduction = introduction;
		this.maritalStatus = maritalStatus;
		this.collects = collects;
		this.posts = posts;
		this.photos = photos;
		this.downloads = downloads;
		this.resources = resources;
		this.replies = replies;
		this.sorts = sorts;
		this.scores = scores;
		this.comments = comments;
		this.articles = articles;
	}

	// Property accessors

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserType() {
		return this.userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getNickName() {
		return this.nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getRank() {
		return this.rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
	}

	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public Integer getUserReadNum() {
		return this.userReadNum;
	}

	public void setUserReadNum(Integer userReadNum) {
		this.userReadNum = userReadNum;
	}

	public Integer getItbeanNum() {
		return this.itbeanNum;
	}

	public void setItbeanNum(Integer itbeanNum) {
		this.itbeanNum = itbeanNum;
	}

	public Integer getArticleNumber() {
		return this.articleNumber;
	}

	public void setArticleNumber(Integer articleNumber) {
		this.articleNumber = articleNumber;
	}

	public Integer getMessageNumber() {
		return this.messageNumber;
	}

	public void setMessageNumber(Integer messageNumber) {
		this.messageNumber = messageNumber;
	}

	public Timestamp getLastLoginTime() {
		return this.lastLoginTime;
	}

	public void setLastLoginTime(Timestamp lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public Timestamp getRegisterTime() {
		return this.registerTime;
	}

	public void setRegisterTime(Timestamp registerTime) {
		this.registerTime = registerTime;
	}

	public String getSignature() {
		return this.signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getHobby() {
		return this.hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String getPosition() {
		return this.position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getIndustry() {
		return this.industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getWorkAge() {
		return this.workAge;
	}

	public void setWorkAge(String workAge) {
		this.workAge = workAge;
	}

	public String getIncome() {
		return this.income;
	}

	public void setIncome(String income) {
		this.income = income;
	}

	public String getIntroduction() {
		return this.introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getMaritalStatus() {
		return this.maritalStatus;
	}

	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	public Set getCollects() {
		return this.collects;
	}

	public void setCollects(Set collects) {
		this.collects = collects;
	}

	public Set getPosts() {
		return this.posts;
	}

	public void setPosts(Set posts) {
		this.posts = posts;
	}

	public Set getPhotos() {
		return this.photos;
	}

	public void setPhotos(Set photos) {
		this.photos = photos;
	}

	public Set getDownloads() {
		return this.downloads;
	}

	public void setDownloads(Set downloads) {
		this.downloads = downloads;
	}

	public Set getResources() {
		return this.resources;
	}

	public void setResources(Set resources) {
		this.resources = resources;
	}

	public Set getReplies() {
		return this.replies;
	}

	public void setReplies(Set replies) {
		this.replies = replies;
	}

	public Set getSorts() {
		return this.sorts;
	}

	public void setSorts(Set sorts) {
		this.sorts = sorts;
	}

	public Set getScores() {
		return this.scores;
	}

	public void setScores(Set scores) {
		this.scores = scores;
	}

	public Set getComments() {
		return this.comments;
	}

	public void setComments(Set comments) {
		this.comments = comments;
	}

	public Set getArticles() {
		return this.articles;
	}

	public void setArticles(Set articles) {
		this.articles = articles;
	}

}