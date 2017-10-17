package com.xtoucher.dao;
/**
 * 广告dao
 */
import java.util.List;

import com.xtoucher.model.AdModel;


public interface AdDao {

	List<AdModel> getList();
	
	public AdModel queryAd(String id);
	
	public void addAd(AdModel adModel);

	void updateAd(AdModel adModel);

	void deleteAd(String id);
	
	

}