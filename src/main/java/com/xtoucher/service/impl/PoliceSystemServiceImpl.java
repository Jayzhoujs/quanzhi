package com.xtoucher.service.impl;


/**
 * 
 * @author 张煜
 * @version
 * 2017-09-06 9:42
 * 添加的service接口实现类
 */

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xtoucher.dao.AccountDao;

import com.xtoucher.dao.BranchDao;
import com.xtoucher.dao.DogBreedDao;
import com.xtoucher.dao.DogColorDao;

import com.xtoucher.dao.DogForbiddenDao;
import com.xtoucher.model.AccountModel;

import com.xtoucher.model.BranchModel;
import com.xtoucher.model.DogBreedModel;
import com.xtoucher.model.DogColorModel;
import com.xtoucher.model.DogForbiddenModel;

import com.xtoucher.service.PoliceSystemService;
import com.xtoucher.util.Des3;

@Service
public class PoliceSystemServiceImpl implements PoliceSystemService {

	// 自动注入dao
	@Autowired
	private AccountDao accountDao;
	@Autowired
	private DogBreedDao dogBreedDao;
	@Autowired
	private DogColorDao dogColorDao;
	@Autowired
	private BranchDao branchDao;
	@Autowired
	private DogForbiddenDao dogForbiddenDao;
	
	

	public List<AccountModel> queryList() {

		return accountDao.queryList();
	}

	public AccountModel queryLoad(String account, String pwd) {
		
		String passWord=pwd;
		try {
			passWord=Des3.encode(pwd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return accountDao.queryLoad(account, passWord);
	}

	// 下面为狗狗种类接口
	public List<DogBreedModel> queryDogBreed() {
		// TODO Auto-generated method stub
		return dogBreedDao.queryDogBreed();
	}

	public void updateDogBreed(DogBreedModel dogBreedModel) {
		dogBreedDao.updateDogBreed(dogBreedModel);
	}

	public int deleteDogBreed(Integer id) {
		// TODO Auto-generated method stub
		return dogBreedDao.deleteDogBreed(id);
	}

	public int saveDogBreed(DogBreedModel dogBreedModel) {
		// TODO Auto-generated method stub
		return dogBreedDao.saveDogBreed(dogBreedModel);
	}

	// 下面为狗狗颜色接口
	public List<DogColorModel> queryDogColor() {
		// TODO Auto-generated method stub
		return dogColorDao.queryDogColor();
	}

	public void updateDogColor(DogColorModel dogColorModel) {
		// TODO Auto-generated method stub
		dogColorDao.updateDogColor(dogColorModel);
	}

	public int deleteDogColor(Integer id) {
		// TODO Auto-generated method stub
		return dogColorDao.deleteDogColor(id);
	}

	public int saveDogColor(DogColorModel dogColorModel) {
		// TODO Auto-generated method stub
		return dogColorDao.saveDogColor(dogColorModel);
	}

	// 下面为地点区域接口
	public List<BranchModel> getPoliceOfficeList(){
		return branchDao.getPoliceOfficeList();
	}
	
	
	public List<BranchModel> queryBranchList() {
		// TODO Auto-generated method stub
		return branchDao.queryBranchList();
	}

	
	public List<BranchModel> queryBranch() {
		// TODO Auto-generated method stub
		return branchDao.queryBranch();
	}

	public List<BranchModel> queryBranchA(String id) {
		// TODO Auto-generated method stub
		return branchDao.queryBranchA(id);
	}
	
	public BranchModel qeuryId(String id) {
		// TODO Auto-generated method stub
		return branchDao.queryId(id);
	}

	public int addBranch(BranchModel branchModel) {
		// TODO Auto-generated method stub
		return branchDao.addBranch(branchModel);
	}

	public int updateBranch(BranchModel branchModel) {
		// TODO Auto-generated method stub
		return branchDao.updateBranch(branchModel);
	}

	public int deleteBranch(String id) {
		// TODO Auto-generated method stub
		return branchDao.deleteBranch(id);
	}

	public List<AccountModel> queryAccount(String branchId) {
		// TODO Auto-generated method stub
		return accountDao.queryAccount(branchId);
	}

	// 添加一个警务帐号
	public void addPoliceUser(AccountModel accountModel) {
		// TODO Auto-generated method stub
		accountDao.addPoliceUser(accountModel);
	}

	// 根据id查询警务帐号
	public AccountModel queryAccountUser(String id,String branchId) {
		// TODO Auto-generated method stub
		AccountModel accountModel=accountDao.queryAccountUser(id);
		if (accountModel==null) {
			return accountModel;
		}
		else if (branchId==null||branchId.replaceAll(" ", "").equals("")||branchId.equals("null")) {
			
			return accountModel;
		}
		else if (branchId.equals(accountModel.getBranchId()+"")) {
			return accountModel;
		}else{
			accountModel=new AccountModel();
			return accountModel;
		}
		
	}

	// 禁用与解封
	public String accountUserDisable(String id,String branchId) {
		// TODO Auto-generated method stub
		AccountModel accountModel=accountDao.queryAccountUser(id);
		if (accountModel==null) {
			return "没有此帐号";
		}
		else if (branchId==null||branchId.equals("null")) {
			accountDao.accountDisable(id);
			return "成功";
		}
		else if (branchId.equals(accountModel.getBranchId()+"")) {
			accountDao.accountDisable(id);
			return "成功";
		}else{
			return "没有此帐号";
		}
		
		

	}

	public String accountAllow(String id,String branchId) {
		// TODO Auto-generated method stub
		AccountModel accountModel=accountDao.queryAccountUser(id);
		if (accountModel==null) {
			return "没有此帐号";
		}
		else if (branchId==null||branchId.equals("null")) {
			accountDao.accountAllow(id);
			return "成功";
		}
		else if (branchId.equals(accountModel.getBranchId()+"")) {
			accountDao.accountAllow(id);
			return "成功";
		}else{
			return "没有此帐号";
		}
		

	}

	// 下面帐号更新与密码修改接口
	public void updateCurrent(AccountModel accountModel) {
		// TODO Auto-generated method stub
		
		String pwd = null;
		try {
			pwd=Des3.encode(accountModel.getPwd());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		accountModel.setPwd(pwd);
		accountDao.updateCurrent(accountModel);
	}

	public String queryPwd(String account) {
		// TODO Auto-generated method stub
		return accountDao.queryPwd(account);
	}

	public void updatePwd(String password, String account) {
		String pwd = null;
		try {
			pwd=Des3.encode(password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		accountDao.updatePwd(pwd, account);
	}
//下面为禁养犬只
	public DogForbiddenModel queryDogForbidden() {
		// TODO Auto-generated method stub
		return dogForbiddenDao.queryDogFor();
	}

	

	public int updateDogFor(DogForbiddenModel dogForbiddenModel) {
		// TODO Auto-generated method stub
		return dogForbiddenDao.updateDogFor(dogForbiddenModel);
	}

	public String queryAcc(String account) {
		// TODO Auto-generated method stub
		return accountDao.queryAcc(account);
	}

	

	
}
