package com.xtoucher.model;

/**
 * 
 * @author 张煜
 * 
 * @version 2017-09-06 09:40 添加本实体类 <br>
 *          实体类为警务登录账号表单
 * 
 */

public class AccountModel {
	private Integer id;
	private String account;
	private String pwd;
	private String headImgUrl;
	private String userName;
	private String phone;
	private Integer branchId;
	private Integer rank;
	private Integer isAvailable;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getHeadImgUrl() {
		return headImgUrl;
	}
	public void setHeadImgUrl(String headImgUrl) {
		this.headImgUrl = headImgUrl;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getRank() {
		return rank;
	}
	public void setRank(Integer rank) {
		this.rank = rank;
	}
	public Integer getIsAvailable() {
		return isAvailable;
	}
	public void setIsAvailable(Integer isAvailable) {
		this.isAvailable = isAvailable;
	}
	public Integer getBranchId() {
		return branchId;
	}
	public void setBranchId(Integer branchId) {
		this.branchId = branchId;
	}
	
}
