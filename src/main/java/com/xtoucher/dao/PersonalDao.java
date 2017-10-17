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

import com.xtoucher.model.AccountModel;

public interface PersonalDao {
	
	public List<AccountModel> queryList();

	public AccountModel queryLoad(@Param(value="account")String account,@Param(value="pwd") String pwd);

	public List<AccountModel> queryAccount(Integer branchId);
}
