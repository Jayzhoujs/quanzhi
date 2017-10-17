package com.xtoucher.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xtoucher.model.ApproModel;
import com.xtoucher.model.ExamineModel;
import com.xtoucher.model.HistoryModel;

/**
 * 
 * @author zy
 * 审批dao
 */
public interface ExamineDao {
	public List<ExamineModel> queryList(int currentPage);

	public ExamineModel queryExamine(String id);
	
	public List<ExamineModel> listExaminBranch(String branchId);
	
	public List<ExamineModel> listExaminBranchAll(String branchId);

	public List<ExamineModel> queryStatus(String status);

	public List<ExamineModel> queryStatusBranch(@Param(value = "status")String status,@Param(value = "branchId")String branchId);

	public List<ExamineModel> listExBranchAll();

	public List<ApproModel> getListAll();

	public List<ApproModel> getListByBranchId(String branchId);

	public ApproModel approvalDetail(String id);

	public ApproModel approvalDetail2(String branchId, String id);

	public HistoryModel approvalHistory2(String branchId, String id);

	public HistoryModel approvalHistory(String id);
}
