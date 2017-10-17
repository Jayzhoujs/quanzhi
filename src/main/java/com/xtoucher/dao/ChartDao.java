package com.xtoucher.dao;

import java.util.List;

import com.xtoucher.model.ChartModel;


public interface ChartDao {

	List<ChartModel> queryAccount();

	List<ChartModel> queryApprovalList();

	List<ChartModel> queryPassed();

	List<ChartModel> queryNotPassed();

	List<ChartModel> queryListByBranch(String startDay,String endDay);

	List<ChartModel> masteDistribution();

	List<ChartModel> queryDogAmount();

	

}
