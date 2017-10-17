package com.xtoucher.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xtoucher.dao.AccountDao;
import com.xtoucher.dao.ApprovalDao;
import com.xtoucher.dao.ApprovalHistoryDao;
import com.xtoucher.dao.ExamineDao;
import com.xtoucher.model.AccountModel;
import com.xtoucher.model.ApproModel;
import com.xtoucher.model.ApprovalHistoryModel;
import com.xtoucher.model.ExamineModel;
import com.xtoucher.model.HistoryModel;
import com.xtoucher.service.ExamineSystemService;

@Service
public class ExamineSystemServiceImpl implements ExamineSystemService {
	@Autowired
	private ExamineDao examineDao;
	@Autowired
	private ApprovalDao approvalDao;
	@Autowired
	private AccountDao accountDao;
	@Autowired
	private ApprovalHistoryDao approvalHistoryDao;
	
	public List<ExamineModel> queryList(int currentPage) {
		// TODO Auto-generated method stub
		return examineDao.queryList(currentPage*10);
	}

	public ExamineModel queryExamine(String id,String branchId) {
		// TODO Auto-generated method stub
		
		ExamineModel examineModel=examineDao.queryExamine(id);
		if (examineModel==null) {
			
			return examineModel;
		}
		else if (branchId==null||branchId.replaceAll(" ", "").equals("")||branchId.equals("null")) {
			return examineModel;
		}
		else if (branchId.equals(examineModel.getBranchId()+"")) {
			return examineModel;
		}else{
			examineModel=new ExamineModel();
			return examineModel;
		}
	}

	public void updateApproval(String id,String status) {
		// TODO Auto-generated method stub
		
		approvalDao.updateApproval(id,status);
	}

	public List<ExamineModel> queryStatus(String status) {
		// TODO Auto-generated method stub
		return examineDao.queryStatus(status);	
	}
	public List<ExamineModel> queryStatusBranch(String status,String branchId) {
		// TODO Auto-generated method stub
		return examineDao.queryStatusBranch(status, branchId);	
	}

	public List<ApprovalHistoryModel> queryAh(String approvalId) {
		// TODO Auto-generated method stub
		return approvalHistoryDao.queryApprovalH(approvalId);
	}

	public AccountModel queryPoliceUser(String accountId) {
		// TODO Auto-generated method stub
		return accountDao.queryAccountUser(accountId);
	}

	public void addApprovalH(ApprovalHistoryModel approvalHistoryModel) {
		// TODO Auto-generated method stub
		Date date = new Date();
		SimpleDateFormat ysdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String hTime = ysdf.format(date);
		approvalHistoryModel.setHandleTime(hTime);
		approvalHistoryDao.addApprovalH(approvalHistoryModel);
	}

	public List<ExamineModel> listExaminBranch(String branchId) {
		// TODO Auto-generated method stub
		return examineDao.listExaminBranch(branchId);
	}
	
	public List<ExamineModel> listExaminBranchAll(String branchId) {
		// TODO Auto-generated method stub
		return examineDao.listExaminBranchAll(branchId);
	}

	public List<ExamineModel> listExBranchAll() {
		// TODO Auto-generated method stub
		return examineDao.listExBranchAll();
	}

	public List<ApproModel> getListByNranchId(String branchId) {
		List<ApproModel> list=new ArrayList<ApproModel>();
		if(branchId==null||"".equals(branchId)){
			//管理员
			list=examineDao.getListAll();
		}
		else{
			//其他角色
			list=examineDao.getListByBranchId(branchId);
		}
		return list;
	}

	public ApproModel approvalDetail(String branchId, String id) {
		ApproModel approModel=new ApproModel();
		if(branchId==null||"".equals(branchId)){
			//管理员
			approModel=examineDao.approvalDetail(id);
		}
		else{
			//其他角色
			approModel=examineDao.approvalDetail2(branchId,id);
		}
		return approModel;
	}

	public HistoryModel approvalHistory(String branchId, String id) {
		HistoryModel historyModel=new HistoryModel();
		if(branchId==null||"".equals(branchId)){
			//管理员
			historyModel=examineDao.approvalHistory(id);
		}
		else{
			//其他角色
			historyModel=examineDao.approvalHistory2(branchId,id);
		}
		return historyModel;
	}

}
