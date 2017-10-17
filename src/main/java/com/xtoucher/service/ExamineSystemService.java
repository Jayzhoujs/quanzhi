package com.xtoucher.service;

import java.util.List;

import com.xtoucher.model.AccountModel;
import com.xtoucher.model.ApproModel;
import com.xtoucher.model.ApprovalHistoryModel;
import com.xtoucher.model.ExamineModel;
import com.xtoucher.model.HistoryModel;

/**
 * 
 * @author zy
 *审批 pc端Biz
 */
public interface ExamineSystemService {
	public List<ExamineModel> queryList(int currentPage);

	public ExamineModel queryExamine(String id,String branchid);
	
	public List<ExamineModel> listExaminBranch(String branchId);
	
	public List<ExamineModel> listExaminBranchAll(String branchId);

	public void updateApproval(String id,String status);

	public List<ExamineModel> queryStatus(String status);
	
	public List<ExamineModel> queryStatusBranch(String status,String branchId);

	public List<ApprovalHistoryModel> queryAh(String approvalId);

	public AccountModel queryPoliceUser(String accountId);

	public void addApprovalH(ApprovalHistoryModel approvalHistoryModel);

	public List<ExamineModel> listExBranchAll();

	public List<ApproModel> getListByNranchId(String branchId);

	public ApproModel approvalDetail(String branchId, String id);

	public HistoryModel approvalHistory(String branchId, String id);
}
