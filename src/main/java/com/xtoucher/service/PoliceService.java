package com.xtoucher.service;

import java.util.List;

import com.xtoucher.model.AccountBranchModel;
import com.xtoucher.model.AccountModel;
import com.xtoucher.model.BranchModel;
import com.xtoucher.model.DogModel;
import com.xtoucher.model.PoliceApprovalModel;
import com.xtoucher.model.ProgressHistoryModel;
public interface PoliceService {

	AccountModel login(String account, String password);

	void update(AccountModel account);

	List<PoliceApprovalModel> getToApprovalList(Integer branchId);

	List<PoliceApprovalModel> toApprovalSearch(Integer branchId, String IDNum,String realName);

	List<PoliceApprovalModel> approvaledSearch(Integer branchId, String IDNum,String realName);

	PoliceApprovalModel getApprovalById(Integer branchId, String id);

	boolean approval(String id, String status, ProgressHistoryModel progressHistoryModel);

	DogModel getDogInfoByKeyWord(String IDNum, String registrationNum);

	List<AccountBranchModel> getAccountListByBranchId(String branchId);

	int accountStatusChange(String id, String status, String branchId);

	List<BranchModel> getBranchListAll();

	List<BranchModel> getBranchById(String branchId);

	AccountModel getAccountById(String id);

	int accountUpdate(AccountModel accountModel);

	int accountAdd(AccountModel accountModel);

	List<BranchModel> getBranchList(String rank);

	
}
