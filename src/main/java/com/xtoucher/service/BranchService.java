package com.xtoucher.service;

import java.util.List;

/**
 * 地点查询Service
 */


import com.xtoucher.model.BranchModel;

public interface BranchService {
	
	public List<BranchModel> queryBranchA();
	
	public BranchModel queryBranch(String id);
	
	public List<BranchModel> queryList(String ParentId);

}
