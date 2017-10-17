package com.xtoucher.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.xtoucher.model.BranchModel;
import com.xtoucher.model.DogBreedModel;
import com.xtoucher.model.DogColorModel;
import com.xtoucher.model.DogModel;
import com.xtoucher.model.StreetModel;
import com.xtoucher.model.UserModel;



public interface HandleService {

	UserModel getUserInfo(UserModel user);

	int isApprovalded(String userId);

	int userInfoUpload(UserModel user);

	List<StreetModel> street(String parentId);

	List<DogBreedModel> breed();

	List<DogColorModel> color();

	List<BranchModel> getBranchList(String type);

	boolean declare(DogModel dog, String userId, String type,String branchId);

	int userInfoCheck(String iDNum);

	UserModel getUserInfoByToken(String token,String uid);

	List<StreetModel> getAllArea();

	List<BranchModel> branchSearch(String type, String keyWord);



}
