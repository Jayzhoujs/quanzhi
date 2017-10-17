package com.xtoucher.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xtoucher.dao.ApprovalDao;
import com.xtoucher.dao.BranchDao;
import com.xtoucher.dao.DogBreedDao;
import com.xtoucher.dao.DogColorDao;
import com.xtoucher.dao.DogDao;
import com.xtoucher.dao.StreetDao;
import com.xtoucher.dao.UserDao;
import com.xtoucher.model.ApprovalModel;
import com.xtoucher.model.BranchModel;
import com.xtoucher.model.DogBreedModel;
import com.xtoucher.model.DogColorModel;
import com.xtoucher.model.DogModel;
import com.xtoucher.model.StreetModel;
import com.xtoucher.model.UserModel;
import com.xtoucher.service.HandleService;
import com.xtoucher.util.AESUtil;
import com.xtoucher.util.Base64Util;
import com.xtoucher.util.Constant;
import com.xtoucher.util.Des3;
import com.xtoucher.util.FileUtil;
import com.xtoucher.util.ShimingUtil;

@Service
public class HandleServiceImpl implements HandleService {

	private static Logger logger = Logger.getLogger(HandleServiceImpl.class);
	@Autowired
	private UserDao userDao;
	@Autowired
	private StreetDao streetDao;
	@Autowired
	private DogBreedDao dogBreedDao;
	@Autowired
	private DogColorDao dogColorDao;
	@Autowired
	private BranchDao branchDao;

	@Autowired
	private DogDao dogDao;

	@Autowired
	private ApprovalDao approvalDao;

	public UserModel getUserInfo(UserModel user) {
		return userDao.getUserInfo(user);
	}

	public int isApprovalded(String userId) {
		// TODO Auto-generated method stub
		return userDao.isApprovalded(userId);
	}

	public int userInfoUpload(UserModel user) {
		String IDNum = user.getIdcardNum();
		try {
			user.setIdcardNum(Des3.encode(IDNum));// 身份证号加密
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userDao.userInfoUpload(user);
	}

	public List<StreetModel> street(String parentId) {
		List<StreetModel> list = new ArrayList<StreetModel>();
		list = streetDao.street(parentId);
		return list;
	}

	public List<DogBreedModel> breed() {
		List<DogBreedModel> list = new ArrayList<DogBreedModel>();
		list = dogBreedDao.queryDogBreed();
		return list;
	}

	public List<DogColorModel> color() {
		List<DogColorModel> list = new ArrayList<DogColorModel>();
		list = dogColorDao.queryDogColor();
		return list;
	}

	public List<BranchModel> getBranchList(String type) {
		List<BranchModel> list = new ArrayList<BranchModel>();
		if ("0".equals(type)) {
			// 派出所
			list = branchDao.getPoliceOfficeList();
		} else {
			// 分局
			list = branchDao.getOfficeList();
		}
		return list;
	}

	/**
	 * userId为UUID,非用户自增id
	 */
	public boolean declare(DogModel dog, String userId, String type,String branchId) {

		UserModel user = new UserModel();
		user.setUserId(userId);
		user = userDao.getUserInfo(user);
		String tempUserId=user.getId();
		if (user != null && !"".equals(user.getId())) {
			// 保存犬只信息
			dogDao.saveInfo(dog);
			user.setDogId(Integer.toString(dog.getId()));
			userDao.userInfoUpload(user);
			DogModel dogTemp = new DogModel();
			dogTemp.setId(dog.getId());
			dogTemp.setRegistrationNum(Constant.getRegistrationNum(dog.getId()));// 犬证登记号
			dogDao.update(dogTemp);// 更新犬证登记号
			
			ApprovalModel approvalModel = new ApprovalModel();
			approvalModel.setUserId(tempUserId);
			approvalModel.setBranchId(branchId);
			approvalModel.setDogId(Integer.toString(dog.getId()));
			approvalModel.setIsDeleted("0");
			approvalModel.setStatus("0");// 审核中
			approvalDao.submit(approvalModel);// 提交审核
			return true;

		} else {
			return false;
		}
	}

	public int userInfoCheck(String iDNum) {
		// TODO Auto-generated method stub
		return userDao.userInfoCheck(iDNum);
	}

	public UserModel getUserInfoByToken(String token, String uid) {
		UserModel user = new UserModel();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("token", token);
		map.put("appid", ShimingUtil.APPID);
		String sig = ShimingUtil.MD5(map);
		map.put("sig", sig);
		JSONObject resJson = ShimingUtil.SendHttpsRequest(map, "getdetectinfo");
		try {
			String errorcode = resJson.get("errorcode").toString();
			// 对方接口请求返回结果：0成功
			if ("0".equals(errorcode)) {
				String resultData = resJson.get("data").toString();
				// 解密

				byte[] keyBytes = ShimingUtil.RESULTKEY.getBytes();
				String result = AESUtil.decrypt(
						Base64Util.decode(resultData, Base64Util.DEFAULT),
						keyBytes);
				System.out.println(result);
				JSONObject json = new JSONObject(result);
				String ID = json.get("ID").toString();
				String name = json.get("name").toString();
				String phone = json.get("phone").toString();
				String sex = json.get("sex").toString();
				String nation = json.get("nation").toString();
				String frontpic = json.get("frontpic").toString();// 身份证正面照片的base64编码
				UserModel userTemp = new UserModel();
				try {
					userTemp.setIdcardNum(Des3.encode(ID));
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				userTemp.setRealName(name);
				userTemp.setPhoneNum(phone);
				if ("男".equals(sex)) {
					userTemp.setGender("0");
				} else {
					userTemp.setGender("1");
				}
				userTemp.setNation(nation);
				// Base64照片存本地
				//userTemp.setIdcardImgUrl(FileUtil.generateImage(frontpic));
				userTemp.setUserId(uid);
				if (userDao.isExist(userTemp) == 0) {
					// 否则新增
					userDao.saveUserInfo(userTemp);
				}
				else{
					userTemp=userDao.getUserInfo(userTemp);
				}
				user = userTemp;
				user.setIdcardNum(ID);
			} else {
				user = null;
			}
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	public List<StreetModel> getAllArea() {
		List<StreetModel> list = new ArrayList<StreetModel>();
		list = streetDao.getAllArea();
		return list;
	}

	public List<BranchModel> branchSearch(String type, String keyWord) {
		List<BranchModel> list = new ArrayList<BranchModel>();
		if("0".equals(type)){
			//派出所网点
			list = branchDao.getPoliceOfficeListByKeyWord(keyWord);
		}
		else{
			//分局网点
			list = branchDao.getBranchListByKeyWord(keyWord);
		}
		
		return list;
	}

	
}
