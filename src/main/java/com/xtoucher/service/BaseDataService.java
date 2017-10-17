package com.xtoucher.service;

import com.xtoucher.model.ProcessModel;
import com.xtoucher.model.RegulationModel;

public interface BaseDataService {

	RegulationModel getRegulation();

	int updateRegulation(RegulationModel regulationModel);

	ProcessModel getProcess();

	int updateProcess(ProcessModel processModel);

}
