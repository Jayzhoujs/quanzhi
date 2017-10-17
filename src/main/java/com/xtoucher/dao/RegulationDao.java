package com.xtoucher.dao;

import com.xtoucher.model.RegulationModel;



public interface RegulationDao {

	RegulationModel getRegulation();
	
	public int updateRegulation(RegulationModel regulationModel);
	
	
}