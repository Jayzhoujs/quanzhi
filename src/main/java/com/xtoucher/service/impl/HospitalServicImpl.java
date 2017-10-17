package com.xtoucher.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xtoucher.dao.AreaDao;
import com.xtoucher.dao.HospitalDao;
import com.xtoucher.model.AreaModel;
import com.xtoucher.model.HospitalModel;
import com.xtoucher.service.HospitalService;

@Service
public class HospitalServicImpl implements HospitalService {

	@Autowired
	private HospitalDao hospitalDao;
	@Autowired
	private AreaDao areaDao;

	public List<HospitalModel> getList() {
		return hospitalDao.getList();
	}

	public List<HospitalModel> getListByKeyword(String name, String area) {
		return hospitalDao.getListByKeyword(name,area);
	}

	public HospitalModel getInfoById(String id) {
		return hospitalDao.getInfoById(id);
	}

	public int addHospital(HospitalModel hospitalModel) {
		// TODO Auto-generated method stub
		return hospitalDao.addHospital(hospitalModel);
	}

	public int deleteHospital(String id) {
		// TODO Auto-generated method stub
		return hospitalDao.deleteHospital(id);
	}

	public int updateHospital(HospitalModel hospitalModel) {
		// TODO Auto-generated method stub
		return hospitalDao.updateHospital(hospitalModel);
	}

	public List<AreaModel> querListPar() {
		// TODO Auto-generated method stub
		return areaDao.queryAreaPr();
	}
	public List<AreaModel> queryArea(){
		return areaDao.qeuryArea();
	}

}
