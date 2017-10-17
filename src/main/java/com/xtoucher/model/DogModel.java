package com.xtoucher.model;
/**
 * 
 * @author 张煜
 * 
 * @version <br>
 *          实体类为犬类详细信息表
 * 
 */


public class DogModel {
	private Integer id;
	private String dogName;
	private String varieties;
	private Integer gender;
	private String dateOfBirth;
	private String color;
	private String immuneNum;
	private Integer isSterilized;
	private Integer uses;
	private Integer isForbidden;
	private String imgUrl;
	private String immuneUrl;
	private Integer editable;
	private String registrationNum;
	private String remark;
	private String createTime;
	private String registrationTime;
	private String isDeleted;
	private String updateTime;
	private String logOffTime;
	private String logOffReason;

	public String getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(String isDeleted) {
		this.isDeleted = isDeleted;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getImmuneNum() {
		return immuneNum;
	}

	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public void setImmuneNum(String immuneNum) {
		this.immuneNum = immuneNum;
	}

	public Integer getIsSterilized() {
		return isSterilized;
	}

	public void setIsSterilized(Integer isSterilized) {
		this.isSterilized = isSterilized;
	}

	public Integer getUses() {
		return uses;
	}

	public void setUses(Integer uses) {
		this.uses = uses;
	}

	public Integer getIsForbidden() {
		return isForbidden;
	}

	public void setIsForbidden(Integer isForbidden) {
		this.isForbidden = isForbidden;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getImmuneUrl() {
		return immuneUrl;
	}

	public void setImmuneUrl(String immuneUrl) {
		this.immuneUrl = immuneUrl;
	}

	public Integer getEditable() {
		return editable;
	}

	public void setEditable(Integer editable) {
		this.editable = editable;
	}

	public String getRegistrationNum() {
		return registrationNum;
	}

	public void setRegistrationNum(String registrationNum) {
		this.registrationNum = registrationNum;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getCreateTime() {
		return createTime.substring(0,10);
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getRegistrationTime() {
		return registrationTime;
	}

	public void setRegistrationTime(String registrationTime) {
		this.registrationTime = registrationTime;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public String getLogOffTime() {
		return logOffTime;
	}

	public void setLogOffTime(String logOffTime) {
		this.logOffTime = logOffTime;
	}

	public String getLogOffReason() {
		return logOffReason;
	}

	public void setLogOffReason(String logOffReason) {
		this.logOffReason = logOffReason;
	}



}
