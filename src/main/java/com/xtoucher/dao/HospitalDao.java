package com.xtoucher.dao;

import java.util.List;

import com.xtoucher.model.HospitalModel;

public interface HospitalDao {

	List<HospitalModel> getList();

	List<HospitalModel> getListByKeyword(String name, String area);

	HospitalModel getInfoById(String id);

	int addHospital(HospitalModel hospitalModel);

	int deleteHospital(String id);

	int updateHospital(HospitalModel hospitalModel);

	
	
	

}