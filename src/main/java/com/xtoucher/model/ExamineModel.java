package com.xtoucher.model;

import java.util.Date;

/**
 * 
 * @author zy
 * @version
 * <br>
 * pc端审核信息model
 */
public class ExamineModel {
	//审批表字段
	private String id;
	private String userId;
	private String dogId;
	private String branchId;
	private String createTime;
	private String status;
	private String isDeleted;
	//用户表所需字段
	private String Uid;
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
	private String uCreateTime;//用户创建时间
	private String companyName;//单位名称
	private String contactName;//联系人姓名
	private String contactPhone;//联系人电话
	private String isAuthenticated;//是否已认证
	private String uUserId;//UUID作为用户id，防止猜测
	//狗狗表所需字段

	private Integer dId;
	private String dogName;
	private String varieties;
	private Integer dGender;
	private Date dateOfBirth;
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
	private String dCreateTime;
	private String registrationTime;
	private String dIsDeleted;
	private String logOffTime;
	private String logOffReason;
	//地点表字段
	private Integer bId;
	private String name;
	private Integer parentId;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getDogId() {
		return dogId;
	}
	public void setDogId(String dogId) {
		this.dogId = dogId;
	}
	public String getBranchId() {
		return branchId;
	}
	public void setBranchId(String branchId) {
		this.branchId = branchId;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(String isDeleted) {
		this.isDeleted = isDeleted;
	}
	public String getUid() {
		return Uid;
	}
	public void setUid(String uid) {
		Uid = uid;
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
	public String getuCreateTime() {
		return uCreateTime;
	}
	public void setuCreateTime(String uCreateTime) {
		this.uCreateTime = uCreateTime;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getIsAuthenticated() {
		return isAuthenticated;
	}
	public void setIsAuthenticated(String isAuthenticated) {
		this.isAuthenticated = isAuthenticated;
	}
	public String getuUserId() {
		return uUserId;
	}
	public void setuUserId(String uUserId) {
		this.uUserId = uUserId;
	}
	public Integer getdId() {
		return dId;
	}
	public void setdId(Integer dId) {
		this.dId = dId;
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
	public Integer getdGender() {
		return dGender;
	}
	public void setdGender(Integer dGender) {
		this.dGender = dGender;
	}
	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
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
	public String getdCreateTime() {
		return dCreateTime;
	}
	public void setdCreateTime(String dCreateTime) {
		this.dCreateTime = dCreateTime;
	}
	public String getRegistrationTime() {
		return registrationTime;
	}
	public void setRegistrationTime(String registrationTime) {
		this.registrationTime = registrationTime;
	}
	public String getdIsDeleted() {
		return dIsDeleted;
	}
	public void setdIsDeleted(String dIsDeleted) {
		this.dIsDeleted = dIsDeleted;
	}
	public Integer getbId() {
		return bId;
	}
	public void setbId(Integer bId) {
		this.bId = bId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
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
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
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
