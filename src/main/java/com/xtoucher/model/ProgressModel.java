package com.xtoucher.model;
/**
 * 审核进度的Model
 * @author so123
 *
 */
public class ProgressModel {
	private String id;
	private String userName;
	private String dogName;
	private String varieties;
	private String submitTime;
	private String imgUrl;
	private String status;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getDogName() {
		return dogName;
	}
	public void setDogName(String dogName) {
		this.dogName = dogName;
	}
	public String getVarieties() {
		return varieties;
	}
	public void setVarieties(String varieties) {
		this.varieties = varieties;
	}
	public String getSubmitTime() {
		return submitTime.substring(0, 10);
	}
	public void setSubmitTime(String submitTime) {
		this.submitTime = submitTime;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

}
