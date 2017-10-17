package com.xtoucher.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xtoucher.dao.ComplaintDao;
import com.xtoucher.model.ComplaintModel;
import com.xtoucher.service.ComplaintService;
import com.xtoucher.util.Constant;

@Service
public class ComplaintServiceImpl implements ComplaintService {

	private static Logger logger = Logger.getLogger(ComplaintServiceImpl.class);
	@Autowired
	private ComplaintDao complaintDao;
	
	
	
	public Map<String, Object> getComplaintList(int currentPage) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<ComplaintModel> list = new ArrayList<ComplaintModel>();
			list = complaintDao.getComplaintList(currentPage*12);
			map.put(Constant.DATA, list);
		} catch (Exception e) {
			map.put(Constant.STATUS, Constant.STATUS_ERROR);
			map.put(Constant.INFO, "查询失败");
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> complaintCommit(ComplaintModel complaintModel) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			complaintDao.complaintCommit(complaintModel);
			map.put(Constant.STATUS, Constant.STATUS_OK);
			map.put(Constant.INFO, "提交成功");
		} catch (Exception e) {
			map.put(Constant.STATUS, Constant.STATUS_ERROR);
			map.put(Constant.INFO, "查询失败");
			e.printStackTrace();
		}
		return map;
	}

	public List<ComplaintModel> queryList() {
		// TODO Auto-generated method stub
		return complaintDao.queryList();
	}

	public ComplaintModel queryComplaint(String id) {
		// TODO Auto-generated method stub
		return complaintDao.queryComplaint(id);
	}

	public void openComplaint(String id) {
		// TODO Auto-generated method stub
		complaintDao.openComplaint(id);
	}

}
