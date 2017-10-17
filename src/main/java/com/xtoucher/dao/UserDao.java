package com.xtoucher.dao;

import java.util.List;

import com.xtoucher.model.UserModel;



public interface UserDao {

	UserModel getUserInfo(UserModel user);

	int isApprovalded(String id);

	int userInfoUpload(UserModel user);
	
	public List<UserModel> queryUser();

	UserModel queryUserDetailed(String id);

	int userInfoCheck(String iDNum);

	void saveUserInfo(UserModel user);

	int isExist(UserModel userTemp);

}