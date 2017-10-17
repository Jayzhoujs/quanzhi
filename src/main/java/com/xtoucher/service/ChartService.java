package com.xtoucher.service;

import java.util.List;

import com.xtoucher.model.ChartModel;


public interface ChartService {

	List<ChartModel> queryAccount();

	List<ChartModel> queryApprovalList();

	List<ChartModel> queryPassed();

	List<ChartModel> queryNotPassed();

	List<ChartModel> queryListByBranch(String startDay,String endDay);

	List<ChartModel> masteDistribution();

	List<ChartModel> queryDogAmount();

	
}
