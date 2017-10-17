package com.xtoucher.service.impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xtoucher.dao.ApprovalDao;
import com.xtoucher.dao.DogDao;
import com.xtoucher.dao.PersonalDao;
import com.xtoucher.model.DogModel;
import com.xtoucher.service.PersonalService;
import com.xtoucher.util.Des3;

@Service
public class PersonalServiceImpl implements PersonalService {

	private static Logger logger = Logger.getLogger(PersonalServiceImpl.class);
	@Autowired
	private PersonalDao personalDao;
	@Autowired
	private DogDao dogDao;
	@Autowired
	private ApprovalDao approvalDao;

	public DogModel getDogInfoByKeyWord(String IDNum, String registrationNum) {
		DogModel dogModel = new DogModel();
		try {
			IDNum = Des3.encode(IDNum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dogModel = dogDao.getDogInfoByKeyWord(IDNum, registrationNum);
		return dogModel;
	}

	public int logOff(String IDNum, String registrationNum, String dogId,
			String reason) {
		try {
			IDNum=Des3.encode(IDNum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//删除审批进度
		approvalDao.deleteByDogId(dogId);
		return dogDao.logOff(IDNum,registrationNum,dogId,reason);
	}
}
