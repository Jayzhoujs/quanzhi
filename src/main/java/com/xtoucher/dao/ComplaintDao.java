package com.xtoucher.dao;
/**
 * 投诉dao
 */

import java.util.List;

import com.xtoucher.model.ComplaintModel;

public interface ComplaintDao {

	List<ComplaintModel> getComplaintList(int currentPage);

	void complaintCommit(ComplaintModel complaintModel);
	
	List<ComplaintModel> queryList();
	
	ComplaintModel queryComplaint(String id);
	
	public void openComplaint(String id);
	
}
