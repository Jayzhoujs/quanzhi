package com.xtoucher.dao;

import java.util.List;

import com.xtoucher.model.ApprovalHistoryModel;

/**
 * 
 * @author zy
 *	审批历史Dao
 */
public interface ApprovalHistoryDao {
	public List<ApprovalHistoryModel>  queryApprovalH(String id);

	public void addApprovalH(ApprovalHistoryModel approvalHistoryModel);
}
