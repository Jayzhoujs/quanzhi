package com.xtoucher.service;

/**
 * @author 张煜
 * @version
 * 2017-09-06 9:42
 * 添加的service接口
 */

import java.util.List;

import com.xtoucher.model.AccountModel;
import com.xtoucher.model.BranchModel;
import com.xtoucher.model.DogBreedModel;
import com.xtoucher.model.DogColorModel;
import com.xtoucher.model.DogForbiddenModel;

public interface PoliceSystemService {

	public List<AccountModel> queryList();

	public AccountModel queryLoad(String account, String pwd);

	// 下面为狗狗种类接口
	public List<DogBreedModel> queryDogBreed();

	public void updateDogBreed(DogBreedModel dogBreedModel);

	public int deleteDogBreed(Integer id);

	public int saveDogBreed(DogBreedModel dogBreedModel);

	// 下面为狗狗颜色接口
	public List<DogColorModel> queryDogColor();

	public void updateDogColor(DogColorModel dogColorModel);

	public int deleteDogColor(Integer id);

	public int saveDogColor(DogColorModel dogColorModel);

	// 下面为地点区域接口
	public List<BranchModel> queryBranchList();
	
	public List<BranchModel> getPoliceOfficeList();

	public List<BranchModel> queryBranch();

	public List<BranchModel> queryBranchA(String id);
	
	public BranchModel qeuryId(String id);

	int addBranch(BranchModel branchModel);

	int updateBranch(BranchModel branchModel);

	int deleteBranch(String id);

	public List<AccountModel> queryAccount(String branchId);

	// 添加一个警务帐号
	public void addPoliceUser(AccountModel accountModel);

	// 根据id查询警务帐号
	public AccountModel queryAccountUser(String id,String branchId);

	// 禁用与解封
	public String accountUserDisable(String id,String branchId);

	public String accountAllow(String id,String branchId);

	// 下面帐号更新与密码修改接口

	public void updateCurrent(AccountModel accountModel);

	public String queryPwd(String account);

	public void updatePwd(String password, String account);

	//禁养犬只
	public DogForbiddenModel queryDogForbidden();
	
	public int updateDogFor(DogForbiddenModel dogForbiddenModel);

	public String queryAcc(String account);

}
