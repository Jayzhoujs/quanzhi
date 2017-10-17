package com.xtoucher.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xtoucher.model.AreaModel;

/**
 * 
 * @author zy
 *地区相关的dao
 */
public interface AreaDao {
	
	public List<AreaModel> qeuryArea();
	
	public List<AreaModel> queryAreaPr();
	
	public AreaModel queryAreaModel(@Param(value = "id")String id);
		
	public void addArea(AreaModel areaModel);
	
	public void updateArea(AreaModel areaModel);
	
	public int deleteArea(@Param(value = "id")String id);
}
