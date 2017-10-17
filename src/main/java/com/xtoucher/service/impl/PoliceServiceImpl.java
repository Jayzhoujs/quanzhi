package com.xtoucher.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xtoucher.dao.AccountDao;
import com.xtoucher.dao.BranchDao;
import com.xtoucher.dao.DogDao;
import com.xtoucher.model.AccountBranchModel;
import com.xtoucher.model.AccountModel;
import com.xtoucher.model.BranchModel;
import com.xtoucher.model.DogModel;
import com.xtoucher.model.PoliceApprovalModel;
import com.xtoucher.model.ProgressHistoryModel;
import com.xtoucher.service.PoliceService;
import com.xtoucher.util.Des3;

@Service
public class PoliceServiceImpl implements PoliceService {

	// 自动注入dao
	@Autowired
	private AccountDao accountDao;
	@Autowired
	private DogDao dogDao;
	@Autowired
	private BranchDao branchDao;

	public AccountModel login(String account, String password) {

		return accountDao.queryLoad(account, password);
	}

	public void update(AccountModel account) {
		accountDao.update(account);
	}

	public List<PoliceApprovalModel> getToApprovalList(Integer branchId) {
		return dogDao.getApprovalList(branchId);
	}

	public List<PoliceApprovalModel> toApprovalSearch(Integer branchId,
			String IDNum, String realName) {
		try {
			IDNum = Des3.encode(IDNum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dogDao.toApprovalSearch(branchId, IDNum, realName);
	}

	public List<PoliceApprovalModel> approvaledSearch(Integer branchId,
			String IDNum, String realName) {
		try {
			IDNum = Des3.encode(IDNum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dogDao.approvaledSearch(branchId, IDNum, realName);
	}

	public PoliceApprovalModel getApprovalById(Integer branchId, String id) {
		return dogDao.getApprovalById(branchId, id);
	}

	public boolean approval(String id, String status,
			ProgressHistoryModel progressHistoryModel) {
		if (dogDao.approval(id, status) > 0) {
			dogDao.saveHistory(progressHistoryModel);
			return true;
		}
		return false;
	}

	public DogModel getDogInfoByKeyWord(String IDNum, String registrationNum) {
		DogModel dogModel = new DogModel();
		try {
			IDNum = Des3.encode(IDNum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dogModel = dogDao.getDogInfoByKeyWord2(IDNum, registrationNum);
		return dogModel;
	}

	public List<AccountBranchModel> getAccountListByBranchId(String branchId) {
		List<AccountBranchModel> list = new ArrayList<AccountBranchModel>();
		if (branchId == null || "".equals(branchId)) {
			// 管理员权限查询所有
			list = accountDao.getAccountListAll();
		} else {
			list = accountDao.getAccountListByBranchId(branchId);
		}
		return list;
	}

	public int accountStatusChange(String id, String status, String branchId) {
		if (branchId == null || "".equals(branchId)) {
			// 管理员权限
			return accountDao.accountStatusChange(id, status);
		} else {
			return accountDao.accountStatusChange2(id, status, branchId);
		}
	}

	public List<BranchModel> getBranchListAll() {
		List<BranchModel> list = new ArrayList<BranchModel>();
		list = branchDao.queryBranchList();
		return list;
	}

	public List<BranchModel> getBranchById(String branchId) {
		List<BranchModel> list = new ArrayList<BranchModel>();
		list = branchDao.getBranchById(branchId);
		return list;
	}

	public AccountModel getAccountById(String id) {
		return accountDao.queryAccountUser(id);
	}

	public int accountUpdate(AccountModel accountModel) {
		int i = 0;
		try {
			accountModel.setPwd(Des3.encode(accountModel.getPwd()));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		i = accountDao.updateInfo(accountModel);// 修改
		return i;
	}

	public int accountAdd(AccountModel accountModel) {
		int i = 0;
		try {
			accountModel.setPwd(Des3.encode(accountModel.getPwd()));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 新增
		if (accountDao.isExit(accountModel.getAccount()) == 0) {
			i = accountDao.addAccount(accountModel);
		}
		return i;
	}

	public List<BranchModel> getBranchList(String rank) {
		List<BranchModel> list = new ArrayList<BranchModel>();
		switch (rank) {
		case "1":
			list = branchDao.queryBranchList();// 所有网点
			break;
		case "2":
			list = branchDao.queryBranch();// 所有分局
			break;
		case "3":
			list = branchDao.queryBranch();// 所有分局
			break;
		case "4":
			list = branchDao.getPoliceOfficeList();// 所有派出所
			break;
		case "5":
			list = branchDao.getPoliceOfficeList();// 所有派出所
			break;
		}
		return list;
	}

}
