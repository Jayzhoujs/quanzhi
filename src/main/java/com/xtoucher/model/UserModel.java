package com.xtoucher.model;

import com.xtoucher.util.Des3;

/**
 * 犬主对象Model
 * @author so123
 *
 */
public class UserModel {
	private String id;
	private String openId;//微信openId
	private String realName;//姓名，单位则为法人姓名
	private String headImgUrl;//微信头像
	private String nickName;//昵称
	private String phoneNum;//手机
	private String idcardNum;//身份证号码
	private String gender;//性别：0：男；1：女
	private String nation;//民族
	private String area;//区域
	private String street;//街道
	private String address;//详细地址
	private String faceImgUrl;//个人照片，正面
	private String idcardImgUrl;//身份证照片
	private String createTime;
	private String dogId;//狗狗id，一人一户一狗
	private String companyName;//单位名称
	private String contactName;//联系人姓名
	private String contactPhone;//联系人电话
	private String isAuthenticated;//是否已认证
	private String isApprovalded;//是否已审批过，之前有审批的不能提交，一人一证一狗
	private String userId;//UUID作为用户id，防止猜测
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOpenId() {
		return openId;
	}
	public void setOpenId(String openId) {
		this.openId = openId;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getHeadImgUrl() {
		return headImgUrl;
	}
	public void setHeadImgUrl(String headImgUrl) {
		this.headImgUrl = headImgUrl;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getIdcardNum() {
		
		return idcardNum;
	}
	public void setIdcardNum(String idcardNum) {
		this.idcardNum = idcardNum;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
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
	public String getFaceImgUrl() {
		return faceImgUrl;
	}
	public void setFaceImgUrl(String faceImgUrl) {
		this.faceImgUrl = faceImgUrl;
	}
	public String getIdcardImgUrl() {
		return idcardImgUrl;
	}
	public void setIdcardImgUrl(String idcardImgUrl) {
		this.idcardImgUrl = idcardImgUrl;
	}
	
	public String getCreateTime() {
		return createTime.substring(0,10);
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getDogId() {
		return dogId;
	}
	public void setDogId(String dogId) {
		this.dogId = dogId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getContactName() {
		return contactName;
	}
	public void setContactName(String contactName) {
		this.contactName = contactName;
	}
	public String getContactPhone() {
		return contactPhone;
	}
	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}
	public String getIsAuthenticated() {
		return isAuthenticated;
	}
	public void setIsAuthenticated(String isAuthenticated) {
		this.isAuthenticated = isAuthenticated;
	}
	public String getIsApprovalded() {
		return isApprovalded;
	}
	public void setIsApprovalded(String isApprovalded) {
		this.isApprovalded = isApprovalded;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
	
}
