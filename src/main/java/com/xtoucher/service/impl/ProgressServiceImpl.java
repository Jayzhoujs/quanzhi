package com.xtoucher.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xtoucher.dao.ProgressDao;
import com.xtoucher.model.ProgressHistoryModel;
import com.xtoucher.model.ProgressModel;
import com.xtoucher.service.ProgressService;
import com.xtoucher.util.Constant;
import com.xtoucher.util.Des3;

@Service
public class ProgressServiceImpl implements ProgressService {

	private static Logger logger = Logger.getLogger(ProgressServiceImpl.class);
	@Autowired
	private ProgressDao progressDao;
	public ProgressModel progressSearch(String IDNum,String phone) {
		
			ProgressModel progress=new ProgressModel();
			if(!"".equals(IDNum)){
				try {
					IDNum=Des3.encode(IDNum);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			progress=progressDao.progressSearch(IDNum,phone);
			return progress;
		
	}
	public Map<String, Object> progressHistory(String approvalId) {
		Map<String, Object> map=new HashMap<String, Object>();
		try{
			ProgressHistoryModel progressHistoryModel=new ProgressHistoryModel();
			progressHistoryModel=progressDao.progressHistory(approvalId);
			map.put("history", progressHistoryModel);
		}
		catch(Exception e){
			map.put(Constant.STATUS, Constant.STATUS_ERROR);
			map.put(Constant.INFO, "提交失败");
			e.printStackTrace();
		}
		return map;
	}
	
}
