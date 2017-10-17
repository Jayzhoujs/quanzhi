package com.xtoucher.service;

import java.util.List;

import com.xtoucher.model.AreaModel;
import com.xtoucher.model.HospitalModel;



public interface HospitalService {

	List<HospitalModel> getList();

	List<HospitalModel> getListByKeyword(String name, String area);

	HospitalModel getInfoById(String id);
	
	List<AreaModel> querListPar();
	List<AreaModel> queryArea();
	
	int addHospital(HospitalModel hospitalModel);
	
	int deleteHospital(String id);
	
	int updateHospital(HospitalModel hospitalModel);
	
}
