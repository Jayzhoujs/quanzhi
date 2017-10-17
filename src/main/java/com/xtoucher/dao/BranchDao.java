package com.xtoucher.dao;

/**
 * 地区dao
 */
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xtoucher.model.BranchModel;
public interface BranchDao {
	public List<BranchModel> queryBranchList();

	public List<BranchModel> queryBranchA(String id);

	public List<BranchModel> queryBranch();
	
	public BranchModel queryId(@Param(value="id")String id);
	
	List<BranchModel> getOfficeList();

	List<BranchModel> getPoliceOfficeList();

	public int addBranch(BranchModel branchModel);

	public int updateBranch(BranchModel branchModel);

	public int deleteBranch(String id);

	public List<BranchModel> getPoliceOfficeListByKeyWord(String keyWord);

	public List<BranchModel> getBranchListByKeyWord(String keyWord);

	public List<BranchModel> getBranchById(String branchId);

}