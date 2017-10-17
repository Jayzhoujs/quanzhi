package com.xtoucher.dao;

/**
 * @author 张煜
 * @version
 * 2017-09-06 09:41
 * 添加Dao
 * 
 */

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xtoucher.model.AccountBranchModel;
import com.xtoucher.model.AccountModel;

public interface AccountDao {

	public List<AccountModel> queryList();

	public AccountModel queryLoad(@Param(value = "account") String account, @Param(value = "pwd") String pwd);

	public List<AccountModel> queryAccount(String branchId);

	public void addPoliceUser(AccountModel accountModel);

	public AccountModel queryAccountUser(String id);

	public void accountDisable(String id);

	public void accountAllow(String id);

	public void updateCurrent(AccountModel accountModel);

	public String queryPwd(@Param(value = "account") String account);

	public void updatePwd(@Param(value = "password") String password, @Param(value = "account") String account);

	public void update(AccountModel account);

	public String queryAcc(String account);

	public List<AccountBranchModel> getAccountListAll();

	public List<AccountBranchModel> getAccountListByBranchId(String branchId);

	public int accountStatusChange(String id, String status);

	public int accountStatusChange2(String id, String status, String branchId);

	public int updateInfo(AccountModel accountModel);

	public int addAccount(AccountModel accountModel);

	public int isExit(String account);


}
