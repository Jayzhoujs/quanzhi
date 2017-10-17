package com.xtoucher.service;

import java.util.List;
import java.util.Map;

import com.xtoucher.model.ComplaintModel;

public interface ComplaintService {
	Map<String, Object> getComplaintList(int currentPage);

	Map<String, Object> complaintCommit(ComplaintModel complaintModel);
	
	public List<ComplaintModel> queryList();
	
	public ComplaintModel queryComplaint(String id);
	
	public void openComplaint(String id);
}
