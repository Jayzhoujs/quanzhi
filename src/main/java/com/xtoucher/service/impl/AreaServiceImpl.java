package com.xtoucher.service.impl;
/**
 * 街道biz实现类
 */

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xtoucher.dao.AreaDao;
import com.xtoucher.model.AreaModel;
import com.xtoucher.service.AreaService;

@Service
public class AreaServiceImpl implements AreaService {

	@Autowired
	private AreaDao areaDao;

	public List<AreaModel> queryArea() {
		// TODO Auto-generated method stub
		return areaDao.qeuryArea();
	}

	public List<AreaModel> queryAreaPr() {
		// TODO Auto-generated method stub
		return areaDao.queryAreaPr();
	}

	public AreaModel queryAreaModel(String id) {
		// TODO Auto-generated method stub
		return areaDao.queryAreaModel(id);
	}

	public void addArea(AreaModel areaModel) {
		// TODO Auto-generated method stub
		areaDao.addArea(areaModel);
	}

	public void updateArea(AreaModel areaModel) {
		// TODO Auto-generated method stub
		areaDao.updateArea(areaModel);
	}

	public int deleteArea(String id) {
		// TODO Auto-generated method stub
		return areaDao.deleteArea(id);
	}

}
