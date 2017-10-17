package com.xtoucher.model;
/**
 * Police端审核查看的Model
 * @author so123
 *
 */
public class PoliceApprovalModel {
	private String id;
	private String realName;
	private String IDNum;
	private String masterGender;
	private String nation;
	private String phone;
	private String area;
	private String street;
	private String address;
	private String dogName;
	private String varieties;
	private String dogGender;
	private String dogBirth;
	private String color;
	private String immuneNum;
	private String isSterilized;
	private String uses;
	private String isForbidden;
	private String imgUrl;
	private String immuneUrl;
	private String createTime;
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
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getIDNum() {
		return IDNum;
	}
	public void setIDNum(String iDNum) {
		IDNum = iDNum;
	}
	public String getMasterGender() {
		return masterGender;
	}
	public void setMasterGender(String masterGender) {
		this.masterGender = masterGender;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public String getDogGender() {
		return dogGender;
	}
	public void setDogGender(String dogGender) {
		this.dogGender = dogGender;
	}
	public String getDogBirth() {
		return dogBirth.substring(0, 10);
	}
	public void setDogBirth(String dogBirth) {
		this.dogBirth = dogBirth;
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
	public void setImmuneNum(String immuneNum) {
		this.immuneNum = immuneNum;
	}
	public String getIsSterilized() {
		return isSterilized;
	}
	public void setIsSterilized(String isSterilized) {
		this.isSterilized = isSterilized;
	}
	public String getUses() {
		return uses;
	}
	public void setUses(String uses) {
		this.uses = uses;
	}
	public String getIsForbidden() {
		return isForbidden;
	}
	public void setIsForbidden(String isForbidden) {
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
	public String getCreateTime() {
		return createTime.substring(0,19);
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	

}
