package com.xtoucher.dao;

import java.util.List;

import com.xtoucher.model.StreetModel;

/**
 * 
 * @author so123
 *
 */
public interface StreetDao {

	List<StreetModel> street(String parentId);

	List<StreetModel> getAllArea();
	
}
