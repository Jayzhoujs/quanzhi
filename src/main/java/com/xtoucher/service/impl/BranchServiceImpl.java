package com.xtoucher.service.impl;
/**
 * 地点查询ServiceImpl
 */


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xtoucher.dao.BranchDao;
import com.xtoucher.model.BranchModel;
import com.xtoucher.service.BranchService;

@Service
public class BranchServiceImpl implements BranchService {
	@Autowired
	private BranchDao branchDao;

	public BranchModel queryBranch(String id) {
		// TODO Auto-generated method stub
		return branchDao.queryId(id);
	}

	public List<BranchModel> queryList(String ParentId) {
		// TODO Auto-generated method stub
		return branchDao.queryBranchA(ParentId);
	}

	public List<BranchModel> queryBranchA() {
		// TODO Auto-generated method stub
		return branchDao.queryBranch();
	}
	
}
