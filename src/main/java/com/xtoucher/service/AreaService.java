package com.xtoucher.service;

import java.util.List;
/**
 * 街道bizSrevice
 * 
 */

import com.xtoucher.model.AreaModel;

public interface AreaService {

	public List<AreaModel> queryArea();

	public List<AreaModel> queryAreaPr();

	public AreaModel queryAreaModel(String id);

	public void addArea(AreaModel areaModel);

	public void updateArea(AreaModel areaModel);

	public int deleteArea(String id);

}
