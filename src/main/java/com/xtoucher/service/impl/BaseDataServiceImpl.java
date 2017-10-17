package com.xtoucher.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xtoucher.dao.ProcessDao;
import com.xtoucher.dao.RegulationDao;
import com.xtoucher.model.ProcessModel;
import com.xtoucher.model.RegulationModel;
import com.xtoucher.service.BaseDataService;
@Service
public class BaseDataServiceImpl implements BaseDataService {

	@Autowired
	private RegulationDao regulationDao;
	@Autowired
	private ProcessDao processDao;
	public RegulationModel getRegulation() {
		return regulationDao.getRegulation();
	}

	public int updateRegulation(RegulationModel regulationModel) {
		return regulationDao.updateRegulation(regulationModel);
	}

	public ProcessModel getProcess() {
		return processDao.process();
	}

	public int updateProcess(ProcessModel processModel) {
		return processDao.updateProcess(processModel);
	}

}
