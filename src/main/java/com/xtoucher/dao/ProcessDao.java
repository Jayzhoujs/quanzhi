package com.xtoucher.dao;

import com.xtoucher.model.ProcessModel;

/**
 * @author 张煜
 * @version
 * 2017-09-06 09:41
 * 添加Dao
 * 
 */


public interface ProcessDao {

	ProcessModel process();

	int updateProcess(ProcessModel processModel);

	

}
