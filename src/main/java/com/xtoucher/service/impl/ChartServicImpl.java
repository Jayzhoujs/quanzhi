package com.xtoucher.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xtoucher.dao.ChartDao;
import com.xtoucher.model.ChartModel;
import com.xtoucher.service.ChartService;

@Service
public class ChartServicImpl implements ChartService {

	@Autowired
	private ChartDao chartDao;

	public List<ChartModel> queryAccount() {
		List<ChartModel> list=new ArrayList<ChartModel>();
		list=chartDao.queryAccount();
		return list;
	}

	public List<ChartModel> queryApprovalList() {
		List<ChartModel> list=new ArrayList<ChartModel>();
		list=chartDao.queryApprovalList();
		return list;
	}

	public List<ChartModel> queryPassed() {
		List<ChartModel> list=new ArrayList<ChartModel>();
		list=chartDao.queryPassed();
		return list;
	}

	public List<ChartModel> queryNotPassed() {
		List<ChartModel> list=new ArrayList<ChartModel>();
		list=chartDao.queryNotPassed();
		return list;
	}

	public List<ChartModel> queryListByBranch(String startDay,String endDay) {
		List<ChartModel> list=new ArrayList<ChartModel>();
		list=chartDao.queryListByBranch(startDay,endDay);
		return list;
	}

	public List<ChartModel> masteDistribution() {
		List<ChartModel> list=new ArrayList<ChartModel>();
		list=chartDao.masteDistribution();
		return list;
	}

	public List<ChartModel> queryDogAmount() {
		List<ChartModel> list=new ArrayList<ChartModel>();
		list=chartDao.queryDogAmount();
		return list;
	}

	

}
